load("//bazel:defs.bzl", "cc_firmware")

cc_library(
    name="power_distribution",
    srcs = [
        "power_distribution.c",
    ],
    hdrs = [
        "api.h",
    ],
    deps = [
        "//libs/gpio",
    ],
)

# bazel build --config=16m1 -c opt //tutorials/power_distribution
