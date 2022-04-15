cc_binary(
    name = "patch_header",
    srcs = [
        "patch_header.c",
    ],
    defines = [
        "DEBUG",
    ],
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//projects/btldr/libs/crc32",
        "//projects/btldr/libs/image:hdrs",
    ],
)
