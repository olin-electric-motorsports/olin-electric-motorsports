#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)}); do
    files+=($(bazelisk query --keep_going --noshow_progress $file))
done

buildables=$(bazelisk query \
    --keep_going \
    --noshow_progress \
    "kind(kibot, rdeps(//..., set(${files[*]})))" 2>/dev/null)

if [[ ! -z $buildables ]]; then
    bazelisk build --config=docker-kicad --build_tag_filters=kicad $buildables 2>/dev/null
fi

# Doesn't include tar file
basenames=()
rm -rf build
mkdir -p build
for file in $buildables; do
    file="${file//://}"
    cp $(bazelisk info bazel-genfiles)/${file:2} build/

    basenames+=($(basename $file))
done

IFS=$'|'; echo "::set-output name=all::${basenames[*]}"

echo "# KiCad Artifacts" >> build/comment.md
echo "" >> build/comment.md

echo "<center>" >> build/comment.md
for file in $(ls build/*.svg); do
    echo "<img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$(basename $file)\" width=\"60%\" />"
done
echo "</center>" >> build/comment.md
