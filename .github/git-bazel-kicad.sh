#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

files=()
for file in $(git diff --name-only ${GITHUB_SHA:-$(git rev-parse HEAD)} ${GITHUB_BASE_REF:-origin/main}); do
    files+=($(bazelisk query --keep_going --noshow_progress $file))
done

buildables=$(bazelisk query \
    --keep_going \
    --noshow_progress \
    "kind(kibot, rdeps(//..., set(${files[*]})))")

if [[ ! -z $buildables ]]; then
    bazelisk build --config=docker-kicad --build_tag_filters=kicad $buildables
fi

# Doesn't include tar file
rm -rf build
mkdir -p build
for file in $buildables; do
    file="${file//://}"
    cp $(bazelisk info bazel-genfiles)/${file:2} build/
done
