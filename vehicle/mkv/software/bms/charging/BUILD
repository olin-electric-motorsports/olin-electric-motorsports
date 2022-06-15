load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "charging",
    srcs = [
        "charging_can.c",
    ],
    hdrs = [
        "charging_can.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
    ],
)
