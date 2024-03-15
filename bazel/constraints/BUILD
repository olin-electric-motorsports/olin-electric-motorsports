package(default_visibility = ["//visibility:public"])

# CPUs
constraint_value(
    name = "avr",
    constraint_setting = "@platforms//cpu",
)

# Microcontrollers
constraint_setting(name = "mcu")

constraint_value(
    name = "atmega16m1",
    constraint_setting = ":mcu",
)

constraint_value(
    name = "atmega64m1",
    constraint_setting = ":mcu",
)

constraint_value(
    name = "atmega328p",
    constraint_setting = ":mcu",
)

constraint_value(
    name = "incompatible_mcu",
    constraint_setting = ":mcu",
)

constraint_value(
    name = "stm32f103rbt6",
    constraint_setting = ":mcu",
)

# Runtime environment
constraint_setting(name = "environment")

constraint_value(
    name = "test_sim",
    constraint_setting = ":environment",
)

constraint_value(
    name = "hitl",
    constraint_setting = ":environment",
)

constraint_value(
    name = "mkv",
    constraint_setting = ":environment",
)

constraint_value(
    name = "hackerboard",
    constraint_setting = ":environment",
)

constraint_value(
    name = "mkvi",
    constraint_setting = ":environment",
)
