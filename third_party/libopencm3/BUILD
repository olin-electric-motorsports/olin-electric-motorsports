# genrule(
#     name = "build",
#     srcs = glob(["**/*"]),
#     outs = [
#         "lib/libopencm3_stm32f1.a",
#     ],
#     cmd = "\
#         ROOT=$$(dirname $(location Makefile)) && \
#         make -C $$ROOT lib/stm32/f1 -j9 && \
#         cp $$ROOT/lib/libopencm3_stm32f1.a $(location lib/libopencm3_stm32f1.a) \
#     ",
# )

# cc_library()

cc_library(
    name = "export",
    srcs = ["libopencm3_stm32f1.a"],
    hdrs = glob(["**/*.h"]),
    include_prefix = "libopencm3/stm32",
    strip_include_prefix = "hdrs/",
    # strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)

# cc_import(
#     name = "libopencm3_stm32f1",
#     static_library = "lib/libopencm3_stm32f1.a",
#     visibility = ["//visibility:public"],
# )

cc_import(
    name = "libopencm3_stm32f1",
    static_library = "libopencm3_stm32f1.a",
    visibility = ["//visibility:public"],
)
