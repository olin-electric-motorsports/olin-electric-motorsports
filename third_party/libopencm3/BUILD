cc_library(
    name = "libopencm3",
    hdrs = glob(["include/**"]),
    includes = ["include"],
    strip_include_prefix = "include",
    tags = ["manual"],
    visibility = ["//visibility:public"],
)

exports_files([
    "ld/linker.ld.S",
])
