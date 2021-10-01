cc_library (
    name = "hdrs",
    hdrs = [
        "api.h",
    ],
)

cc_library(
    name = "gpio",
    deps = [
        ":hdrs",
    ],
    visibility = ["//visibility:public"],
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
