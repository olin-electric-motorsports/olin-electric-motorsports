load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "utests",
    srcs = [
        "test_yaml_handler.py",
        "test_c_generator.py",
        "conftest.py",
    ],
    data = [
        "tx_only.yml",
        "rx_only.yml",
        "rx_fail.yml",
    ],
    deps = [
        "//projects/can_api:yaml_handler",
        "//projects/can_api:c_generator",
    ],
)
