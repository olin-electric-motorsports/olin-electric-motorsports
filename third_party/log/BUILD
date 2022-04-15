cc_library(
    name = "log",
    srcs = [
        "src/log.c",
    ],
    hdrs = [
        "src/log.h",
    ],
    defines = [
        "LOG_USE_COLOR",
    ],
    includes = ["src"],
    strip_include_prefix = "src",
    tags = ["manual"],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:public"],
)
