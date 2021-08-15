package(default_visibility = ["//visibility:public"])

platform(
    name="avr_common",
    constraint_values = [
        "//bazel/constraints:avr",
        "@platforms//os:none",
    ],
)

platform(
    name = "atmega16m1_avr",
    parents = [":avr_common"],
    constraint_values = [
        "//bazel/constraints:atmega16m1",
    ],
)

platform(
    name = "atmega328p_avr",
    parents = [":avr_common"],
    constraint_values = [
        "//bazel/constraints:atmega328p",
    ],
)
