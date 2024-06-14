#!/usr/bin/env bash

# Ensure go and buildifier are installed
if ! command -v go &>/dev/null; then
    echo "go could not be found. Install with 'sudo apt install golang'"
    exit 1

elif ! command -v buildifier &>/dev/null; then
    echo "buildifier could not be found. Install with \
'go install github.com/bazelbuild/buildtools/buildfier@latest',"
    echo "then add 'export PATH=$PATH:$HOME/go/bin' your .bashrc"
    exit 1
fi

if [ -z "$1" ]; then
    echo "No command specified. Use one of: \"check-branch\", \
\"reformat-branch\", \"check-staged\", or \"reformat-staged\""
    exit 1
fi

# check bazel files in the current branch
if [ "$1" = "check-branch" ]; then
    commit_id=$(git show-ref "${GITHUB_BASE_REF:-origin/main}" | awk '{print $1}')
    changed_files=$(git diff --name-only "$commit_id" | grep -iE '(BUILD|WORKSPACE|.bzl)$')
    out=""
    for file in $changed_files; do
        file_out=$(buildifier -mode=check "$file" 2>&1)
        out="$out""$file_out"
    done
    if [ -z "$out" ]; then
        echo "No Bazel files to reformat on the current branch"
    else
        echo "$out"
    fi
    exit 0

# format bazel files in the current branch
elif [ "$1" = "reformat-branch" ]; then
    commit_id=$(git show-ref "${GITHUB_BASE_REF:-origin/main}" | awk '{print $1}')
    changed_files=$(git diff --name-only "$commit_id" | grep -iE '(BUILD|WORKSPACE|.bzl)$')
    for file in $changed_files; do
        buildifier -mode=fix "$file"
    done
    exit 0

# check staged bazel files
elif [ "$1" = "check-staged" ]; then
    out=""
    for file in $(git diff --staged --name-only | grep -iE '(BUILD|WORKSPACE|.bzl)$'); do
        file_out=$(buildifier -mode=check "$file" 2>&1)
        out="$out$file_out"
    done
    if [ -z "$out" ]; then
        echo "No staged Bazel files to reformat"
    else
        echo "$out"
    fi
    exit 0

# format staged bazel files; bazel file formatting for pre-commit
elif [ "$1" = "reformat-staged" ]; then
    for file in $(git diff --staged --name-only | grep -iE '(BUILD|WORKSPACE|.bzl)$'); do
        buildifier -mode=fix "$file"
        git add "$file"
    done
    exit 0

else
    echo "Command not recognized. Use one of: \"check-branch\", \
\"reformat-branch\", \"check-staged\", or \"reformat-staged\""
    exit 1
fi
