load("//bazel/tools:defs.bzl", "can_api_files")
# load("//bazel:defs.bzl", "cc_firmware")
load (":build.bzl", "sensing_firmware")

exports_files([
    "sensing.yml",
])

sensing_firmware("front")
sensing_firmware("rear")

can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkvi:mkvi.dbc",
    yaml = ":sensing.yml",
)
