load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "bms_tasks",
    srcs = [
        "openwire_task.c",
        "temperature_task.c",
        "voltage_task.c",
        "current_task.c",
    ],
    hdrs = [
        "tasks.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//vehicle/mkv/software/bms:bms_config",
        "//vehicle/mkv/software/bms:can_api",
        "//vehicle/mkv/software/bms/ltc6811",
        "//vehicle/mkv/software/bms/utils",
    ],
)
