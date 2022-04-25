#!/bin/bash

GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}
GITHUB_BASE_REF=${GITHUB_BASE_REF:=main}

CHANGED_PY_FILES=$(git diff --name-only origin/$GITHUB_BASE_REF..$(git rev-parse --short "$GITHUB_SHA") | grep ".py$")

if [[ ! -z ${CHANGED_PY_FILES} ]]; then
    echo "Changed .py files:"
    echo ${CHANGED_PY_FILES}
    black --check --diff ${CHANGED_PY_FILES}
else
    echo "No Python files changed"
fi
