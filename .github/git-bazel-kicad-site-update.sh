if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

echo "Yo I am here"

GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}

files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)} | grep "kicad_pcb$\|sch$"); do
    files+=($(bazel query --keep_going --noshow_progress $file))
done

echo "Check Here"

buildables=$(bazel query --keep going --noshow_progress "kind(kibot, rdeps(//..., set(${files[*]})))" 2>/dev/null)

echo "Before Buildables"
echo "${buildables}"
echo "After Buildables"

if [[ ! -z $buildables ]]; then 
    echo "Building:"
    echo "${buildables}"
fi

echo "End of File"