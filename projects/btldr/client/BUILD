cc_binary(
    name = "btldr-client",
    srcs = [
        "main.c",
    ],
    deps = [
        ":btldr-client-libs",
        "@log//:log",
    ],
)

cc_library(
    name = "btldr-client-libs",
    srcs = [
        "can_client.c",
        "commands.c",
    ],
    hdrs = [
        "can_client.h",
        "commands.h",
    ],
    visibility = ["//visibility:private"],
)
