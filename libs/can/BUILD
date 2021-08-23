cc_library(
    name = "can",
    srcs = [
        "can.c",
    ],
    hdrs = [
        "api.h",
        "mob.h",
    ],
    target_compatible_with = [
        "//bazel/constraints:atmega16m1",
    ],
    visibility = ["//visibility:public"],
)

# cc_library(
#     name = "can_legacy",
#     srcs = [
#         "legacy/can.c",
#     ],
#     hdrs = [
#         "legacy/can.h",
#     ],
#     visibility = ["//visibility:public"],
#     deprecation = """This library is deprecated in favor of //libs/can:can and
# should be transitioned.""",
# )
