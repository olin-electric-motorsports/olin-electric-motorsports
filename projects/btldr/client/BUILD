cc_binary(
    name = "client",
    srcs = [
        "main.c",
    ],
    deps = [
        ":btldr_client_libs",
        "@log//:log",
    ],
)

cc_library(
    name = "btldr_client_libs",
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
