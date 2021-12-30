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

def can_api_files(name, node, dbc):
    native.genrule(
        name = name + "_tools",
        srcs = [
            dbc,
        ],
        outs = [
            "can_tools.c",
            "can_tools.h",
        ],
        tools = [
            "@cantools_//:tools",
        ],
        cmd = "./$(location @cantools_//:tools) generate_c_source --database-name can_tools --output-directory $(RULEDIR) $(location " + dbc + ")",
    )

    native.genrule(
        name = name + "_api",
        srcs = [
            dbc,
            "//projects/can_api/files/c_templates:c_file.j2",
            "//projects/can_api/files/c_templates:h_file.j2",
        ],
        outs = [
            node + "_can_api.c",
            node + "_can_api.h",
        ],
        tools = [
            "//projects/can_api:c_generator",
        ],
        cmd = "$(location //projects/can_api:c_generator) -o $(RULEDIR) -n " + node + " -d $(location " + dbc + ") -c $(location //projects/can_api/files/c_templates:c_file.j2) -H $(location //projects/can_api/files/c_templates:h_file.j2)",
    )

    cc_library(
        name = name,
        srcs = [
            ":can_tools.c",
            ":" + node + "_can_api.c",
        ],
        hdrs = [
            ":can_tools.h",
            ":" + node + "_can_api.h",
        ],
        deps = [
            "//libs/can",
        ],
        visibility = ["//visibility:public"],
    )
