load("//bazel:defs.bzl", "cc_firmware")

def sensing_firmware(location):
    defines = {}

    if location == "front":
        defines["SENSING_LOCATION"] = 0

    if location == "rear":
        defines["SENSING_LOCATION"] = 1

    cc_firmware(
        name = "sensing_{}".format(location),
        srcs = [
            "sensing.c",
            "sensing.h",
        ],
        defines = defines,
        target_compatible_with = [
            "//bazel/constraints:atmega16m1",
        ],
        visibility = ["//visibility:public"],
        deps = [
            ":can_api",
            "//libs/adc",
            "//libs/gpio",
            "//libs/timer",
            "//projects/btldr:btldr_lib",
        ],
    )
