./buildifier --mode=fix -r .
./scripts/clang-format.sh reformat
./.github/python-black.sh