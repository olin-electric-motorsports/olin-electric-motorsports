load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "utils",
    srcs = [
        "can.c",
        "mux.c",
        "fault.c",
    ],
    hdrs = [
        "can.h",
        "mux.h",
        "fault.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/ltc6811",
        "//vehicle/mkv/software/bms:can_api",
        "//vehicle/mkv/software/bms:bms_config",
    ],
)
