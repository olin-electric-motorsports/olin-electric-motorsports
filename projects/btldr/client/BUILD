cc_binary(
    name = "client",
    srcs = [
        "main.c",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    deps = [
        ":btldr_client_libs",
        "@log",
    ],
)

cc_library(
    name = "btldr_client_libs",
    srcs = [
        "can.c",
        "flash.c",
        "ping.c",
    ],
    hdrs = [
        "can.h",
        "client.h",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:private"],
    deps = [
        "//projects/btldr:can_isp_hdrs",
        "//projects/btldr/libs/image:hdrs",
        "@log",
    ],
)
