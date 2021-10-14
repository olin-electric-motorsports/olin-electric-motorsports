py_library(
    name = "utils",
    srcs = ["utils.py"],
    visibility = ["//visibility:private"],
)

py_library(
    name = "hitl",
    srcs = [
        "cancontroller.py",
        "ecu.py",
        "iocontroller.py",
        "roadkillharness.py",
    ],
    visibility = ["//visibility:public"],
    deps = [":utils"],
)
