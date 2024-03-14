load("//bazel:defs.bzl", "cc_arm_firmware")

cc_arm_firmware(
    name = "test_stm_image",
    srcs = [
        "test.c",
    ],
    target_compatible_with = [
        "//bazel/constraints:stm32f103rbt6",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//third_party/libopencm3:export",
    ],
)
