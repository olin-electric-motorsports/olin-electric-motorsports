load("//vehicle/mkv:ecus.bzl", "ECUS")

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

py_binary(
    name = "updatr_yml_gen",
    srcs = [
        "updatr_yml_gen.py",
    ],
    main = "updatr_yml_gen.py",
)

genrule(
    name = "updatr_dbc",
    srcs = [],
    outs = ["updatr.dbc"],
    cmd = "$(location :updatr_yml_gen) \'" + json.encode(ECUS) + "\' $@",
    tools = [":updatr_yml_gen"],
    visibility = ["//visibility:public"],
)
