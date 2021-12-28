load("@cantools_deps//:requirements.bzl", "requirement")
load("@rules_python//python:defs.bzl", "py_binary", "py_library")

package(
    default_visibility = ["//visibility:public"],
)

py_library(
    name = "cantools_lib",
    srcs = glob(
        include = ["cantools/**/*.py"],
    ),
    deps = [
        requirement("bitstruct"),
        requirement("python-can"),
        requirement("textparser"),
        requirement("diskcache"),
    ],
)

py_binary(
    name = "tools",
    srcs = ["cantools/__main__.py"],
    main = "cantools/__main__.py",
    python_version = "PY3",
    deps = [
        ":cantools_lib",
    ],
)
