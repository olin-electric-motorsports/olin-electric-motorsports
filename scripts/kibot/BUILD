exports_files(glob(["*.kibot.yaml"]))
exports_files([
    "requirements.txt"
])

load("@rules_python//python:defs.bzl", "py_binary")

# This creates the "//scripts/kibot:kibot" target that your custom rule is looking for.
# It correctly defines 'kibot' as a Python executable that gets its code
# from the @kibot_deps repository you defined in MODULE.bazel.
py_binary(
    name = "kibot",
    # 'entry_point' is the modern way to run a tool from a pip-installed package.
    entry_point = "@kibot_deps//:kibot",
    visibility = ["//visibility:public"],
)
