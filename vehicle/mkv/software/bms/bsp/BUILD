load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bsp",
    srcs = [
        "bsp.c",
        "mux.c",
        "can.c",
    ],
    hdrs = [
        "bsp.h",
        "mux.h",
        "can.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//libs/can",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
)
