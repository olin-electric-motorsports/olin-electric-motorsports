load("@rules_python//python:defs.bzl", "py_binary", "py_library")

py_binary(
    name = "sensing_yml_generator",
    srcs = [
        "sensing_yml_generator.py",
    ],
    data = [
        "//vehicle/mkv/software/bms:bms_config.h",
    ],
    visibility = ["//visibility:public"],
)

genrule(
    name = "bms_sensing.yml",
    srcs = [
        "//vehicle/mkv/software/bms:bms_config.h",
    ],
    outs = [
        "bms_sensing.yml",
    ],
    cmd = "$(location :sensing_yml_generator) -c $(location //vehicle/mkv/software/bms:bms_config.h) -o $(OUTS)",
    tools = [
        ":sensing_yml_generator",
    ],
    visibility = ["//visibility:public"],
)
