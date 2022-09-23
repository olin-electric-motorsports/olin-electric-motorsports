genrule(
    name = "build",
    srcs = glob(["**/*"]),
    outs = [
        "lib/libopencm3_stm32f1.a",
    ],
    cmd = "\
        ROOT=$$(dirname $(location Makefile)) && \
        make -C $$ROOT lib/stm32/f1 -j9 && \
        cp $$ROOT/lib/libopencm3_stm32f1.a $(location lib/libopencm3_stm32f1.a) \
    ",
)

cc_library(
    name = "export",
    hdrs = glob(["include/**/*.h"]),
    strip_include_prefix = "include",
    visibility = ["//visibility:public"],
)

cc_import(
    name = "libopencm3_stm32f1",
    static_library = "lib/libopencm3_stm32f1.a",
    visibility = ["//visibility:public"],
)
