#!/bin/bash
# requires bazel and python

# absolute path of repository root
ROOT=$(git rev-parse --show-toplevel)

# install virtual pre-checkout hook
# the pre-checkout hook will prevent checkout if the symbols haven't been commited
cat << EOF > ${ROOT}/.git/hooks/pre-checkout
#!/bin/bash
echo "Running pre-checkout hook. To skip this step run SKIP_PRE_CHECKOUT=true git checkout..."
# set PRE_CHECKOUT flag
export PRE_CHECKOUT=true
# check for SKIP_PRE_CHECKOUT flag
if [ ! -z \$SKIP_PRE_CHECKOUT ] && \$SKIP_PRE_CHECKOUT
then
    exit 0
fi

# switch to branch before checkout
git switch --quiet -
# ensure any symbol changes are up to date
if test -f ${ROOT}/parts/schematic/oem.kicad_sym; then
    rm -rf ${ROOT}/parts/schematic/oem
    bazel run //tools/symbols:convert -- library2symbols --source ${ROOT}/parts/schematic/oem.kicad_sym --out ${ROOT}/parts/schematic/oem
fi
# switch back to destination branch
git switch --quiet -
EOF

# install post-checkout hook
# the post-checkout hook generates a kicad_sym file from the symbols in parts/schematic/oem
cat << EOF > ${ROOT}/.git/hooks/post-checkout
#!/bin/bash
# check for PRE_CHECKOUT flag
if [ ! -z \$PRE_CHECKOUT ] && \$PRE_CHECKOUT
then
    exit 0
fi

# run pre-checkout hook
. .git/hooks/pre-checkout

bazel run //tools/symbols:convert -- symbols2library --source ${ROOT}/parts/schematic/oem --out ${ROOT}/parts/schematic/oem.kicad_sym
EOF

# install pre-commit hook
# the pre-commit hook generates files for parts/schematic/oem from a kicad_sym file

cat << EOF > ${ROOT}/.git/hooks/pre-commit
#!/bin/bash
if test -f ${ROOT}/parts/schematic/oem.kicad_sym; then
    rm -rf ${ROOT}/parts/schematic/oem
    bazel run //tools/symbols:convert -- library2symbols --source ${ROOT}/parts/schematic/oem.kicad_sym --out ${ROOT}/parts/schematic/oem
fi
git add ${ROOT}/parts/schematic/oem
EOF