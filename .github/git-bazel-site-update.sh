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
    
generate_post_data()
{
    cat <<EOF
{
    "commit_number": "$GITHUB_SHA",
    "buildables_list": "$buildables"
}
EOF
}

if [[ ! -z $buildables ]]; then
    echo "Files to update in site:"
    echo "${buildables}"
    post_request_data={"commit_number": "${GITHUB_SHA}", "buildable_list": "${buildables}"}
    curl -X POST -H "Content-type: application/json" -d "$(generate_post_data)" "https://kicad.olinelectricmotorsports.com"
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