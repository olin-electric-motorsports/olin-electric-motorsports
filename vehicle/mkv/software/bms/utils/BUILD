load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "utils",
    srcs = [
        "can.c",
        "fault.c",
        "mux.c",
    ],
    hdrs = [
        "can.h",
        "fault.h",
        "mux.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms:bms_config",
        "//vehicle/mkv/software/bms:can_api",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
)
