load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_tasks",
    srcs = [
        "voltage_task.c",
        "temperature_task.c",
        "openwire_task.c"
    ],
    hdrs = [
        "tasks.h"
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//vehicle/mkv/software/bms:can_api",
        "//vehicle/mkv/software/bms/ltc6811",
        "//vehicle/mkv/software/bms/utils",
        "//vehicle/mkv/software/bms:bms_config",
    ],
)
