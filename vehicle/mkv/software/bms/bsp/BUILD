load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bsp",
    srcs = [
        "bsp.c",
        "can.c",
        "mux.c",
    ],
    hdrs = [
        "bsp.h",
        "can.h",
        "mux.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
        "//libs/gpio",
        "//libs/spi",
        "//libs/timer",
        "//vehicle/mkv/software/bms/ltc6811",
    ],
)
