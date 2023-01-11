load("//bazel:defs.bzl", "cc_arm_firmware")
load("@bazel_embedded//tools/openocd:defs.bzl", "openocd_flash")

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

openocd_flash(
    name = "main_flash",
    device_configs = [
        "target/stm32h7x_dual_bank.cfg",
    ],
    image = ":main.stripped",
    interface_configs = [
        "interface/stlink.cfg",
    ],
    transport = "hla_swd",
)