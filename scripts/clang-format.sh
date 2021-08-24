#!/bin/bash

# Ensure git-clang-format is installed
if ! command -v git-clang-format &> /dev/null
then
    echo "git-clang-format could not be found. Install with sudo apt install clang-format"
    exit 1
fi

if [ -z "$1" ]
then
    echo "No command specified. Use either \"reformat\" or \"check\""
    exit 1
fi

if [ "$1" = "check" ]
then
    commit_id=$(git show-ref ${GITHUB_BASE_REF:-origin/main} | awk '{print $1}')
    out=$(git-clang-format -f --diff --commit $commit_id --style=file -q)

    if [ "$out" != "no modified files to format" ] && [ "$out" != "" ]
    then
        echo "Formatting errors, run ./scripts/clang_format.sh reformat"
        exit 1
    fi

    exit 0
elif [ "$1" = "reformat" ]
then
    git-clang-format -f --style=file --commit origin/main
else
    echo "Command not recognized. Use either \"reformat\" or \"check\""
    exit 1
fi
