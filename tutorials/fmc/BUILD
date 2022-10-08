load("//bazel/tools:defs.bzl", "can_api_files")

exports_files([
    "motor_command.yml",
])

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":motor_command.yml",
)