load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//bazel:defs.bzl", "cc_firmware")
load("//vehicle/mkv:ecus.bzl", "ECUS")

exports_files(
    srcs = ["image_hdr.c"],
)

[
    cc_firmware(
        name = ecu["name"] + "_btldr",
        srcs = [
            "btldr.c",
        ],
        copts = [
            "-nostartfiles",
            "-static",
            "-Wl,--section-start=.text=0x3000",  # Start at the boot start address
            "-Wl,-u,vfprintf -lprintf_min",
            "-ffunction-sections",
        ],
        defines = [
            "BTLDR_ID=" + ecu["btldr_id"],
        ],
        linkopts = [
            "-static",
            "-nostartfiles",
            "-Wl,-u,vfprintf -lprintf_min",
        ],
        target_compatible_with = select({
            "//bazel/constraints:atmega16m1": [],
            "//bazel/constraints:atmega64m1": [],
            "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
        }),
        visibility = ["//visibility:public"],
        deps = [
            ":can_isp",
            "//libs/can",
            "//projects/btldr/libs/image",
            "//projects/btldr/libs/shmem",
        ],
    )
    for ecu in ECUS
]

# https://kchodorow.com/2017/03/27/stamping-your-builds/
genrule(
    name = "git_sha_header",
    srcs = [],
    outs = ["git_sha.h"],
    cmd = """
        echo -n \"#pragma once\n\n#define \" > $@;
        cat bazel-out/stable-status.txt | grep STABLE_GIT_COMMIT >> $@
    """,
    stamp = True,
    visibility = ["//visibility:public"],
)

cc_library(
    name = "btldr_lib",
    srcs = [
        "btldr_lib.c",
    ],
    hdrs = [
        "btldr_lib.h",
        ":git_sha_header",
    ],
    visibility = ["//visibility:public"],
    # copts = [
    #     "-static",
    #     "-nostartfiles",
    #     "-ffunction-sections",
    #     "-Wl,-u,vfprintf -lprintf_min",
    # ],
    deps = [
        ":can_isp",
        "//projects/btldr/libs/image",
        "//projects/btldr/libs/shmem",
    ],
)

cc_library(
    name = "can_isp",
    srcs = [
        "can_isp.c",
        "commands.c",
    ],
    hdrs = [
        "can_isp.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//libs/can",
        "//projects/btldr/libs/flash",
        "//projects/btldr/libs/image",
        "//projects/btldr/libs/shmem",
    ],
)
