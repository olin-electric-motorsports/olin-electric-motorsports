load("//bazel:defs.bzl", "cc_firmware")



cc_library(
    name = "power_distribution",
    hdrs = [
        "api.h",
    ],
    srcs = [
        "power_distribution.c",
    ],
    deps = [
        "//libs/gpio",
    ]
)

# bazel build --config=16m1 -c opt //tutorials/power_distribution