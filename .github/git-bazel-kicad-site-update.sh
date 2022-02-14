if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi
echo "Beginning of File"

GITHUB_SHA=${GITHUB_SHA:=$(git rev-parse HEAD)}

files=()
for file in $(git diff --name-only --diff-filter=ACMRT ${GITHUB_BASE_SHA:-"origin/main"} ${GITHUB_SHA:-$(git rev-parse HEAD)} | grep "kicad_pcb$\|sch$"); do
    files+=($(bazelisk query --keep_going --noshow_progress $file))
done

buildables=$(bazelisk query \
    --keep_going \
    --noshow_progress \
    "kind(kibot, rdeps(//..., set(${files[*]})))" 2>/dev/null)

if [[ ! -z $buildables ]]; then
    echo "Files to update in site:"
    echo "${buildables}"
else
    echo "Nothing to update"
fi
