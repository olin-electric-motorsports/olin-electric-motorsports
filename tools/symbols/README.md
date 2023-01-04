# Symbol Converter

## Usage


### `symbols2library`
Convert symbols to `.kicad_sym` library.

If you have installed the git hooks (`./scripts/install_kicad_git_hooks`), this will run automatically after each `git checkout`.

Example:

```bash
bazel run //tools/symbols:convert -- symbols2library --source /mnt/data/Formula/olin-electric-motorsports/parts/schematic/oem -o /mnt/data/Formula/olin-electric-motorsports/parts/schematic/oem.kicad_sym
```


### `library2symbols`
Convert a `.kicad_sym` library to symbols.

If you have installed the git hooks (`./scripts/install_kicad_git_hooks`), this will run automatically during each `git commit` and add symbol files to the commit.

If you do not wish to have this happen you can `git commit --no-verify` instead and then manually run the script.

Example:

```bash
bazel run //tools/symbols:convert -- library2symbols --source /mnt/data/Formula/olin-electric-motorsports/parts/schematic/oem.kicad_sym -o /mnt/data/Formula/olin-electric-motorsports/parts/schematic/oem
```