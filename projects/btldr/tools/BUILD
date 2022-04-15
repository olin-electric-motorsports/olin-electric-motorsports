cc_binary(
    name = "patch_header",
    srcs = [
        "patch_header.c",
    ],
    visibility = ["//visibility:public"],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    defines = [
        "DEBUG",
    ],
    deps = [
        "//projects/btldr/libs/image:hdrs",
        "//projects/btldr/libs/crc32",
    ],
)
