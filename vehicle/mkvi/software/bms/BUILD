load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "bms.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bms.yml",
)
