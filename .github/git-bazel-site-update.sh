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

files=()
for file in buildables; do
    files+=$file
done
echo "Hopefully a list: "
echo $files
if [[ ! -z $buildables ]]; then
    echo "Files to update in site:"
    echo "${buildables}"
    build_list=`echo  ${buildables} | jq -R . | jq -sc .`
    echo "Data being sent through post request: "
    echo "${build_list}"
    echo "Post request data full: "
    echo "{\"commit_number\": \""${GITHUB_SHA}"\", \"buildable_list\": \"${build_list}\"}"
    echo "Post Request Result: "
    curl -X POST -H "Content-type: application/json" -d "{\"commit_number\": \""${GITHUB_SHA}"\", \"buildable_list\": ${build_list}}" "https://kicad.olinelectricmotorsports.com"
    echo "Post request sent to kicad artifacts site"
else
    echo "Nothing to update"
fi

# tasks:
# create a list of board names that have been updated
    # this involves substrings, including the up to ":" and up until ".", only problem is this only applies to .pdf, more cleaning
    # needs to be done on the other file types, maybe further up until suffixes?
# store in a multi-layored dictionary? links to each of the three things that the site links to
    # links can be found by using the suffixes, just need to figure out which suffix corresponds to which link
    # also figure out link format based on jack's shell script
# post request with the elements in the dictionary, along wiht the commit number