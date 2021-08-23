#!/bin/bash

# Ensure git-clang-format is installed
if ! command -v git-clang-format &> /dev/null
then
    echo "git-clang-format could not be found. Install with sudo apt install clang-format"
    exit 1
fi

exec 2>&1

if [ "$1" = "run" ]
then
    git-clang-format -f --style=file --commit origin/main
else
    out=$(git-clang-format -f --diff --commit origin/main --style=file -q)
    if [ "$out" != "no modified files to format" ]
    then
        echo "Formatting errors"
        exit 1
    fi
fi

exit 0
