load("@rules_cc//cc:defs.bzl", "cc_library")

def dbc_gen(name, srcs):
    native.genrule(
        name = name,
        srcs = srcs,
        outs = [
            name,
        ],
        tools = [
            "//projects/can_api:dbc_generator",
        ],
        cmd = "$(location //projects/can_api:dbc_generator) -o $(OUTS) $(SRCS)",
        visibility = ["//visibility:public"],
    )

def can_api_files(name, yaml, dbc):
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
        name = name + "_gen",
        srcs = [
            dbc,
            yaml,
            "//projects/can_api/files/c_templates:c_file.j2",
            "//projects/can_api/files/c_templates:h_file.j2",
        ],
        outs = [
            "can_api.c",
            "can_api.h",
        ],
        tools = [
            "//projects/can_api:c_generator",
        ],
        cmd = "$(location //projects/can_api:c_generator) -o $(RULEDIR) -y $(location " + yaml + ") -d $(location " + dbc + ") -c $(location //projects/can_api/files/c_templates:c_file.j2) -H $(location //projects/can_api/files/c_templates:h_file.j2)",
    )

    cc_library(
        name = name + "_hdrs",
        hdrs = [
            "can_tools.h",
            "can_api.h",
        ],
        include_prefix = ".",
        visibility = ["//visibility:public"],
    )

    cc_library(
        name = name,
        srcs = [
            "can_tools.c",
            "can_api.c",
        ],
        deps = [
            "//libs/can",
            ":" + name + "_hdrs",
        ],
        visibility = ["//visibility:public"],
    )

# def btldr_updater(name, btldr_id, image):
# cc_firmware(
#     name = name,
#     srcs = [
#         "btldr.c",
#     ],
#     deps = [
#         "//libs/can",
#         "//projects/btldr/libs/image",
#         "//projects/btldr/libs/shmem",
#         ":can_isp",
#     ],
#     copts = [
#         "-nostartfiles",
#         "-static",
#         "-Wl,--section-start=.text=0x3000", # Start at the boot start address
#         "-Wl,-u,vfprintf -lprintf_min",
#         "-ffunction-sections",
#     ],
#     target_compatible_with = select({
#         "//bazel/constraints:atmega16m1": [],
#         "//bazel/constraints:atmega64m1": [],
#         "//conditions:default": ["//bazel/constraints:incompatible_mcu"],
#     }),
#     visibility = ["//visibility:public"],
# )
