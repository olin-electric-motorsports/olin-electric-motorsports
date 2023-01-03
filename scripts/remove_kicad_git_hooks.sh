#!/bin/bash

# absolute path of repository root
ROOT=$(git rev-parse --show-toplevel)

mv "${ROOT}/.git/hooks/pre-commit" "${ROOT}/.git/hooks/pre-commit.old"
mv "${ROOT}/.git/hooks/post-checkout" "${ROOT}/.git/hooks/post-checkout.old"