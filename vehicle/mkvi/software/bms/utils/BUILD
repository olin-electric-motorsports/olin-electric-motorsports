load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_utils",
    srcs = [
        "cell_balancing.c",
        "fault.c",
        "i2c_helpers.c",
    ],
    hdrs = [
        "cell_balancing.h",
        "fault.h",
        "i2c_helpers.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/common/ltc6811:ltc681x",
        "//vehicle/mkvi/software/bms:bms_config",
        "//vehicle/mkvi/software/bms:can_api",
    ],
)
