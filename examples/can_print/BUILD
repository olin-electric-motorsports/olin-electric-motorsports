load("//bazel:defs.bzl", "cc_firmware")
load("//bazel/tools:defs.bzl", "can_api_files", "dbc_gen")

exports_files([
    "can_print_example.yml",
])

# Used for debugging with compiler preprocessor output.
cc_binary(
    name = "can_print_debug",
    srcs = [
        "can_print_example.c",
    ],
    copts = [
        "-E",
        "-P",
    ],
    linkopts = [],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/timer",
        "//projects/can_print",
    ],
)

cc_firmware(
    name = "can_print_example",
    srcs = [
        "can_print_example.c",
    ],
    can_print_bitrate = "500000",
    can_print_bus = "can0",
    can_print_flash_isp = "usbasp",
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    deps = [
        ":can_api",
        "//libs/timer",
        "//projects/can_print",
    ],
)

dbc_gen(
    name = "can_print_example.dbc",
    srcs = [
        "//examples/can_print:can_print_example.yml",
        "//projects/can_print:can_print.yml",
    ],
)

can_api_files(
    name = "can_api",
    dbc = "//examples/can_print:can_print_example.dbc",
    yaml = ":can_print_example.yml",
)
