#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}

files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)} | grep "kicad_pcb$\|sch$"); do
    files+=($(bazelisk query --keep_going --noshow_progress $file))
done

buildables=$(bazelisk query \
    --keep_going \
    --noshow_progress \
    "kind(kibot, rdeps(//..., set(${files[*]})))" 2>/dev/null)

if [[ ! -z $buildables ]]; then
    echo "Building:"
    echo "${buildables}"
    bazelisk build \
        --config=docker-kicad \
        --noshow_progress \
        --build_tag_filters=kicad \
        $buildables 2>/dev/null

    # Doesn't include tar file
    rm -rf build
    mkdir -p build

    for file in $buildables; do
        file="${file//://}"
        mkdir -p build/$(dirname ${file:2})
        cp $(bazelisk info bazel-genfiles)/${file:2} build/${file:2}
    done

    rm -rf build/comment.md

    echo "Creating GH comment"
    echo "# KiCad Artifacts" >> build/comment.md

    echo "<details><summary>File links</summary><ul>" >> build/comment.md
    for file in $(find build -type f); do
        chmod 777 $file
        if [[ ! $file == "build/comment.md" ]]; then
            url="https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$file"
            echo "<li><a href=\"$url\">$(basename $file)</a></li>" >> build/comment.md
        fi
    done

    echo "</ul></details>" >> build/comment.md

    echo "Converting SVGs to use white backgrounds"
    for file in $(find build -name '*.svg' -type f); do
        cp ${file} ${file}_old
        # chmod 777 ${file} ${file}_old
        rsvg-convert -b white -f svg ${file}_old > ${file}
        rm -rf ${file}_old
    done

    for file in $(find build -name "*_sch.svg" -type f); do
        echo "<p align=\"center\"><img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/${file}?ref=${GITHUB_SHA}\" width=\"100%\"/></p>" >> build/comment.md
    done

    for file in $(find build -name "*_pcb.svg" -type f); do
        echo "<p align=\"center\">" >> build/comment.md
        echo "<img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$(basename $file)?ref=${GITHUB_SHA}\" width=\"60%\"/>" >> build/comment.md
        echo "</p>" >> build/comment.md
    done
else
    echo "Nothing to build"
fi
