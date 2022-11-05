load("//tools/pytest:defs.bzl", "pytest_test")

pytest_test(
    name = "utests",
    srcs = [
        "conftest.py",
        "test_c_generator.py",
        "test_yaml_handler.py",
    ],
    data = [
        "rx_fail.yml",
        "rx_mask.yml",
        "rx_only.yml",
        "tx_only.yml",
    ],
    deps = [
        "//projects/can_api:c_generator",
        "//projects/can_api:yaml_handler",
    ],
)
