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
    name = "atmega328p_avr",
    constraint_values = [
        "//bazel/constraints:atmega328p",
    ],
    parents = [":avr_common"],
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
    name = "linux-x86_64",
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
)
