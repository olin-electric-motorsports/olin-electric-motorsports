load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "test_yaml_handler",
    srcs = [
        "test_yaml_handler.py",
    ],
    data = [
        "tx_only.yml",
    ],
    deps = [
        "//projects/can_api:yaml_handler",
    ],
)
