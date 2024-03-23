load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_tasks",
    srcs = [
        "current.c",
        # "temperature.c",
        # "voltage.c",
        # "openwire.c",
    ],
    hdrs = [
        "tasks.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//vehicle/common/ltc6811:ltc681x",
        "//vehicle/mkvi/software/bms:bms_config",
        "//vehicle/mkvi/software/bms:can_api",
        "//vehicle/mkvi/software/bms/utils:bms_utils",
    ],
)
