#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

# Used in CI to fetch origin/main so that there is something to compare changed
# files to
if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

# Set the HEAD Git commit (the current commit)
GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}

# Creates a list of all layouts and schematics in the vehicle/mkv folder
# files=()
# for file in $(find vehicle/mkv -type f | grep "kicad_pcb$\|kicad_sch$"); do
#     files+=($(bazel query --keep_going --noshow_progress $file))
# done
# Creates a list of .kicad_pcb and .kicad_sch files that have changed since the
# GITHUB_BASE_REF
files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)} | grep "kicad_pcb$\|kicad_sch$"); do
    files+=($(bazelisk query --keep_going --noshow_progress $file))
done

# Gets a list of Bazel targets that include the files from above
buildables=$(bazelisk query \
    --keep_going \
    --noshow_progress \
    "kind(kibot, rdeps(//..., set(${files[*]})))" 2>/dev/null)

# Only build if there are things that have changed
if [[ ! -z $buildables ]]; then
    echo "Building:"
    echo "${buildables}"

    # Build all of the targets that have changed
    bazelisk build \
        --config=docker-kicad \
        --noshow_progress \
        --build_tag_filters=kicad \
        $buildables 2>/dev/null

    # Clear out the build/ folder
    rm -rf build
    mkdir -p build

    # Copy all the built files from their Bazel folder to the `build/` folder
    site_update_data=()
    for file in $buildables; do
        file="${file//://}"
        mkdir -p build/$(dirname ${file:2})
        cp $(bazelisk info bazel-genfiles)/${file:2} build/${file:2}
        if [ "${file: -3}" == pdf ]; then
            site_update_data+=$file
            site_update_data+=${file:0:-4}.html
            python3 .github/test.py build/${file:2:-4}.html
        fi
    done

    # Create a Markdown file that will be uploaded as a GitHub PR comment
    echo "Creating GH comment"
    echo "# KiCad Artifacts" >> build/comment.md

    # List of files that were generated
    for file in $(find build -type f); do
        chmod 777 $file
        if [[ ! $file == "build/comment.md" ]]; then
            url="https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/${file#build/}"
            echo "<li><a href=\"$url\">$(basename $file)</a></li>" >> build/comment.md
        fi
    done

    # By default, SVGs are have transparent backgrounds, which makes things hard
    # to read when using dark-mode on Github. This converts them to have white
    # backgrounds
    echo "Converting SVGs to use white backgrounds"
    for file in $(find build -name '*.svg' -type f); do
        cp ${file} ${file}_old
        rsvg-convert -b white -f svg ${file}_old > ${file}
        rm -rf ${file}_old
    done

    # Adds SVGs of the layouts as images (uses the same caching principles as
    # above).
    for file in $(find build -name "*_pcb.svg" -type f); do
        echo "<p align=\"center\">" >> build/comment.md
        echo "<img src=\"https://oem-outline.nyc3.digitaloceanspaces.com/kicad-artifacts/${file#build/}?ref=${GITHUB_SHA}\" width=\"60%\"/>" >> build/comment.md
        echo "</p>" >> build/comment.md
    done

    echo "Sending POST request to artifacts site to trigger update"
    echo "Post Request Result:"
    curl -X POST -H "Content-type: application/json" -d "{\"commit_hash\": \""${GITHUB_SHA}"\", \"updated_board_files\": \"${site_update_data}\"}" "https://kicad.olinelectricmotorsports.com"

else
    echo "Nothing to build"
fi
