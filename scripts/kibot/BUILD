exports_files(glob(["*.kibot.yaml"]))
exports_files([
    "requirements.txt"
])

load("@rules_python//python/entry_points:py_console_script_binary.bzl", "py_console_script_binary")

# This creates the "//scripts/kibot:kibot" target that your custom rule is looking for.
# It correctly defines 'kibot' as a Python executable that gets its code
# from the @kibot_deps repository you defined in MODULE.bazel.
py_console_script_binary(
    name = "kibot",
    pkg = "@kibot_deps//kibot",
    visibility = ["//visibility:public"],
)