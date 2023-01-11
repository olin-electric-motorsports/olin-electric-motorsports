load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//bazel:defs.bzl", "cc_firmware")
load("//vehicle/mkv:ecus.bzl", "ECUS")

package(default_visibility = ["//visibility:public"])

[
    cc_firmware(
        name = ecu + "_btldr",
        srcs = [
            "btldr.c",
        ],
        copts = [
            "-fdata-sections",
        ],
        defines = [
            "BTLDR_ID=" + data["btldr_id"],
        ],
        linkopts = [
            "-static",
            "-nostartfiles",
            "-Wl,--section-start=.text=0x3000",  # Start at the boot start address
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
            "//libs/uart",
            "//projects/btldr/libs/image",
            "//projects/btldr/libs/shmem",
        ],
    )
    for ecu, data in ECUS.items()
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
    deps = [
        ":can_isp",
        "//projects/btldr/libs/image",
        "//projects/btldr/libs/shmem",
    ],
)

cc_library(
    name = "can_isp_hdrs",
    hdrs = [
        "can_isp.h",
    ],
    visibility = ["//visibility:public"],
)

cc_library(
    name = "can_isp",
    srcs = [
        "can_isp.c",
        "commands.c",
    ],
    deps = [
        ":can_isp_hdrs",
        "//libs/can",
        "//projects/btldr/libs/flash",
        "//projects/btldr/libs/image",
        "//projects/btldr/libs/shmem",
    ],
)
