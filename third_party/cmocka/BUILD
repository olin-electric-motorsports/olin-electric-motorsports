load("@rules_foreign_cc//foreign_cc:defs.bzl", "cmake")

filegroup(
    name = "all_srcs",
    srcs = glob(["**"]),
    visibility = ["//visibility:public"],
)

cmake(
    name = "cmocka",
    visibility = ["//visibility:public"],
    lib_source = ":all_srcs",
    out_shared_libs = ["libcmocka.so.0"],
)
