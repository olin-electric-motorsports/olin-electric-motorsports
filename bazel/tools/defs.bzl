load("@rules_cc//cc:defs.bzl", "cc_library")

def _dbc_impl(ctx):
    """
    Generates a DBC file from a list of YAML files
    """
    pass

dbc = rule(
    implementation = _dbc_impl,
    attrs = {
        "srcs": attr.label_list(
            mandatory = True,
        ),
    },
    executable = False,
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
