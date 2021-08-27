cc_library(
    name = "cmocka",
    srcs = [
        "include/cmocka_pbc.h",
        "include/cmocka_private.h",
        "src/cmocka.c",
    ],
    hdrs = ["include/cmocka.h"],
    defines = [
        "HAVE_SIGNAL_H",
        "HAVE_STRINGS_H",
    ],
    includes = ["include"],
    strip_include_prefix = "include",
    tags = ["manual"],  # must be built as @cmocka//:cmocka
    target_compatible_with = [
        "@platforms//os:linux",
    ],
    visibility = ["//visibility:public"],
)
