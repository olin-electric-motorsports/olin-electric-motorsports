cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
)

cc_library(
    name = "gpio",
    srcs = [
        "gpio.c",
    ],
    hdrs = [
        "pin_defs.h",
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
    ],
)

cc_library(
    name = "mock",
    srcs = [
        "mock/gpio.c",
    ],
    deps = [
        ":hdrs",
    ],
)
