
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

package(
    default_visibility = ["//visibility:public"],
)

py_library(
    name = "cantools_lib",
    srcs = glob(
        include = ["cantools/**/*.py"],
    ),
    tags = ["manual"],
    deps = [
        "@cantools_deps_bitstruct//:pkg",
        "@cantools_deps_python_can//:pkg",
        "@cantools_deps_textparser//:pkg",
        "@cantools_deps_diskcache//:pkg",
    ],
)

py_binary(
    name = "tools",
    srcs = ["cantools/__main__.py"],
    main = "cantools/__main__.py",
    python_version = "PY3",
    tags = ["manual"],  # must be built as @cmocka//:cmocka
    deps = [
        ":cantools_lib",
    ],
)