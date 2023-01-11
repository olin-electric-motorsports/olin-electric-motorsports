load("//bazel:defs.bzl", "cc_arm_firmware")

cc_arm_firmware(
    name = "test_stm_image",
    srcs = [
        "test.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:stm32f103c8t6",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//third_party/libopencm3:export",
    ],
)
