load("@rules_cc//cc:defs.bzl", "cc_library")

def dbc_gen(name, srcs):
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [name],
        tools = [
            "//projects/can_api:dbc_generator",
        ],
        cmd = "$(location //projects/can_api:dbc_generator) -o $(OUTS) $(SRCS)",
        visibility = ["//visibility:public"],
    )

def can_api_files(name, dbc):
    native.genrule(
        name = name + "_files",
        srcs = [
            dbc,
        ],
        outs = [
            "can_api.c",
            "can_api.h",
        ],
        tools = [
            "@cantools_//:tools",
        ],
        cmd = "./$(location @cantools_//:tools) generate_c_source --database-name can_api --output-directory $(RULEDIR) $(location " + dbc + ")",
    )

    cc_library(
        name = name,
        srcs = [
            ":can_api.c",
        ],
        hdrs = [
            ":can_api.h",
        ],
        visibility = ["//visibility:public"],
    )
