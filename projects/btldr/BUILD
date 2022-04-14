load("//bazel:defs.bzl", "cc_firmware")

cc_firmware(
    name = "btldr",
    srcs = [
        "btldr.c",
    ],
    deps = [
        "//projects/btldr/libs/image",
        "//projects/btldr/libs/shmem",
        "//projects/btldr/libs/can_isp",
        "//projects/btldr/libs/can_lib",
    ],
    copts = [
        "-nostartfiles",
        "-static",
        "-Wl,--section-start=.text=0x3000", # Start at the boot start address
        "-Wl,-u,vfprintf -lprintf_min"
    ],
    target_compatible_with = select({
        "//bazel/constraints:atmega16m1": [],
        "//bazel/constraints:atmega64m1": [],
        "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
    }),
    visibility = ["//visibility:public"],
)

cc_library(
    name = "btldr_lib",
    srcs = [
        "btldr_lib.c",
    ],
    hdrs = [
        "btldr_lib.h",
    ],
    visibility = ["//visibility:public"],
)
