package(default_visibility = ["//visibility:public"])

platform(
    name = "avr_common",
    constraint_values = [
        "//bazel/constraints:avr",
        "@platforms//os:none",
    ],
)

platform(
    name = "atmega16m1_avr",
    constraint_values = [
        "//bazel/constraints:atmega16m1",
    ],
    parents = [":avr_common"],
)

platform(
    name = "atmega64m1_avr",
    constraint_values = [
        "//bazel/constraints:atmega64m1",
    ],
    parents = [":avr_common"],
)

platform(
    name = "atmega328p_avr",
    constraint_values = [
        "//bazel/constraints:atmega328p",
    ],
    parents = [":avr_common"],
)

platform(
    name = "stm32f103_arm",
    constraint_values = [
        "//bazel/constraints:stm32f103rbt6",
    ],
    parents = [
        "@arm_none_eabi//platforms:arm_none_generic",
    ],
)

platform(
    name = "avr_test_sim",
    constraint_values = [
        "//bazel/constraints:test_sim",
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)

platform(
    name = "hitl_firmware_test",
    constraint_values = [
        "//bazel/constraints:atmega64m1",
        "//bazel/constraints:hitl",
    ],
    parents = [
        ":avr_common",
    ],
)

platform(
    name = "hackerboard",
    constraint_values = [
        "//bazel/constraints:atmega16m1",
        "//bazel/constraints:hackerboard",
    ],
    parents = [
        ":avr_common",
    ],
)

platform(
    name = "linux-x86_64",
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)
