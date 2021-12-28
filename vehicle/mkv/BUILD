load("//bazel/tools:defs.bzl", "dbc", "can_api_files")

dbc(
    name = "mkv_dbc",
    srcs = [
        "//vehicles/mkv/software/air_control:air.yml",
    ],
)

# Generates C source
can_api_files(
    name = "mkv_can_api",
    dbc = ":mkv.dbc",
)
