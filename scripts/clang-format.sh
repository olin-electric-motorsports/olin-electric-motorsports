#!/bin/bash

if ! command -v git-clang-format &> /dev/null
then
    echo "git-clang-format could not be found. Install with sudo apt install clang-format"
    exit
fi

if [ "$1" = "run" ]
then
    out=$(git-clang-format -f --style file ./**/*)
    if [ "$out" != "" ]
    then
        echo $out
        exit 0
    fi
else
    out=$(git-clang-format -f --diff --style file ./**/* -q)
    if [ "$out" != "no modified files to format" ]
    then
        echo "Formatting errors"
        exit 1
    fi
fi
