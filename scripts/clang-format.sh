#!/bin/bash

# Ensure git-clang-format is installed
if ! command -v git-clang-format &>/dev/null; then
    echo "git-clang-format could not be found. Install with sudo apt install clang-format"
    exit 1
fi

if [ -z "$1" ]; then
    echo "No command specified. Use either \"reformat\" or \"check\""
    exit 1
fi

# check c files in the current branch
if [ "$1" = "check-branch" ]; then
    commit_id=$(git show-ref ${GITHUB_BASE_REF:-origin/main} | awk '{print $1}')
    out=$(git-clang-format -f --diff --commit $commit_id --style=file -q)

    if [ "$out" != "no modified files to format" ] && [ "$out" != "" ]; then
        echo "Formatting errors, run ./scripts/clang_format.sh reformat-branch"
        exit 1
    fi
    exit 0

# format c files in the current branch
elif [ "$1" = "reformat-branch" ]; then
    git-clang-format -f --style=file --commit origin/main
    exit 0

# check staged c files
elif [ "$1" = "check-staged" ]; then
    out=$(git-clang-format -f --diff --staged --style=file -q)

    if [ "$out" != "no modified files to format" ] && [ "$out" != "" ]; then
        echo "Formatting errors, run ./scripts/clang_format.sh reformat-staged"
        exit 1
    fi

# format staged c files; clang formatting for pre-commit
elif [ "$1" = "reformat-staged" ]; then
    for file in $(git diff --staged --name-only | grep -iE '\.(c|h|cpp|hpp)$'); do
        clang-format --style=file -i "$file"
        git add "$file"
    done
    exit 0

else
    echo "Command not recognized. Use either \"reformat\" or \"check\""
    exit 1
fi
