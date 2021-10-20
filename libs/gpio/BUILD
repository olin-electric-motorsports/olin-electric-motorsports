cc_library(
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
)

cc_library(
    name = "gpio",
    srcs = [
        "gpio.c",
    ],
    hdrs = [
        "pin_defs.h",
    ],
    visibility = ["//visibility:public"],
    deps = [
        ":hdrs",
        "//libs/uart",
    ],
)

cc_library(
    name = "mock",
    srcs = [
        "mock/gpio.c",
    ],
    deps = [
        ":hdrs",
    ],
)
