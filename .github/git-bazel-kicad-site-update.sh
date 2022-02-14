#!/bin/bash

# Script to build all KiCad targets that have been changed in the PR

# Used in CI to fetch origin/main so that there is something to compare changed
# files to
if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi
echo "Beginning of File"
# Set the HEAD Git commit (the current commit)
GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}

# Creates a list of .kicad_pcb and .sch files that have changed since the
# GITHUB_BASE_REF
files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)} | grep "kicad_pcb$\|sch$"); do
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
    for file in $buildables; do
        file="${file//://}"
        mkdir -p build/$(dirname ${file:2})
        cp $(bazelisk info bazel-genfiles)/${file:2} build/${file:2}
    done
else
    echo "Nothing to build"
fi
