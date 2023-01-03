#!/bin/bash
# requires bazel and python

# absolute path of repository root
ROOT=$(git rev-parse --show-toplevel)

# install post-checkout hook
# the post-checkout hook generates a kicad_sym file from the symbols in parts/schematic/oem
cat << EOF > ${ROOT}/.git/hooks/post-checkout
#!/bin/bash
bazel run //tools/symbols:convert -- symbols2library --source ${ROOT}/parts/schematic/oem --out ${ROOT}/parts/schematic/oem.kicad_sym
EOF

# install pre-commit hook
# the pre-commit hook generates files for parts/schematic/oem from a kicad_sym file

cat << EOF > ${ROOT}/.git/hooks/pre-commit
#!/bin/bash
bazel run //tools/symbols:convert -- library2symbols --source ${ROOT}/parts/schematic/oem.kicad_sym --out ${ROOT}/parts/schematic/oem
EOF