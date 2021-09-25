#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

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
    basenames=()
    rm -rf build
    mkdir -p build

    for file in $buildables; do
        file="${file//://}"
        cp $(bazelisk info bazel-genfiles)/${file:2} build/

        basenames+=($(basename $file))
    done

    rm -rf build/comment.md

    echo "Creating GH comment"
    echo "# KiCad Artifacts" >> build/comment.md

    echo "<details><summary>File links</summary><ul>" >> build/comment.md
    for file in build/*; do
        if [[ ! $file == "build/comment.md" ]]; then
            url="https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$(basename $file)"
            echo "<li><a href=\"$url\">$(basename $file)</a></li>" >> build/comment.md
        fi
    done

    echo "</ul></details>" >> build/comment.md

    echo "Converting SVGs to use white backgrounds"
    for file in build/*.svg; do
        mv ${file} ${file}_old
        rsvg-convert -b white -f svg ${file}_old > ${file}
        rm -rf ${file}_old
    done

    for file in build/*_sch.svg; do
        echo "<p align=\"center\"><img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$(basename $file)\" width=\"100%\"/></p>" >> build/comment.md
    done

    for file in build/*_pcb.svg; do
        echo "<p align=\"center\">" >> build/comment.md
        echo "<img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/$(basename $file)\" width=\"60%\"/>" >> build/comment.md
        echo "</p>" >> build/comment.md
    done
else
    echo "Nothing to build"
fi
