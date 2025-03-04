load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_tasks",
    srcs = [
        "current.c",
        "openwire.c",
        "temperature.c",
        "voltage.c",
    ],
    hdrs = [
        "tasks.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//vehicle/common/ltc6811:ltc681x",
        "//vehicle/mkvii/software/bms:bms_config",
        "//vehicle/mkvii/software/bms:can_api",
        "//vehicle/mkvii/software/bms/utils:bms_utils",
    ],
)
