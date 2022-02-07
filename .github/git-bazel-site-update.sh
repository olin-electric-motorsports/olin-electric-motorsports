'
if [[ ! -z $GITHUB_BASE_REF ]]; then
    git fetch origin $GITHUB_BASE_REF
fi

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
    echo "Building:"
    echo "${buildables}"
'
echo "Site update should be happening now"
curl -X POST -H "Content-type: application/json" -d '{"schematic": "schematic4", "layout": "layout4", "bom": "bom4"}' "http://localhost:5000/hitl/commit4"