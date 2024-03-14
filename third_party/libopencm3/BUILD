cc_library(
    name = "export",
    hdrs = glob(["**/*.h"]),
    include_prefix = "libopencm3/stm32",
    strip_include_prefix = "hdrs/",
    visibility = ["//visibility:public"],
    deps = [":compiled_library"],
)

cc_import(
    name = "compiled_library",
    hdrs = glob(["*.h"]),
    static_library = "libopencm3_stm32f1.a",
    alwayslink = 1,
)
