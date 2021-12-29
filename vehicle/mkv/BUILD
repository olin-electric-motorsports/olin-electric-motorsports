load("//bazel/tools:defs.bzl", "dbc_gen", "can_api_files")

# Generates DBC
dbc_gen(
    name = "mkv.dbc",
    srcs = [
        "//vehicle/mkv/software/air_control:air.yml",
        "//vehicle/mkv/software/motor_controller:motor_controller.dbc",
    ],
)

# Generates C source
can_api_files(
    name = "mkv_can_api",
    dbc = ":mkv.dbc",
)
