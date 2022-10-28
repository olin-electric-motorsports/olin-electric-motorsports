load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "tester_board.yml",
])

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":tester_board.yml",
)