cc_library(
    name = "cmocka",
    srcs = [
        "src/cmocka.c",
        "include/cmocka_private.h",
    ],
    hdrs = ["include/cmocka.h"],
    includes = ["include"],
    defines = [
        "HAVE_SIGNAL_H",
        "HAVE_STRINGS_H",
    ],
    strip_include_prefix = "include",
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:public"],
)
