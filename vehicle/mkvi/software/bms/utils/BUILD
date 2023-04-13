load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_utils",
    srcs = [
        "fault.c",
        "mux.c",
    ],
    hdrs = [
        "fault.h",
        "mux.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkvi/software/bms:bms_config",
        "//vehicle/mkvi/software/bms:can_api",
        "//vehicle/common/ltc6811:ltc681x",
    ],
)
