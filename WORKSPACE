workspace(name="formula")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

register_execution_platforms("@local_config_platform//:host", "//bazel/platforms:all")

register_toolchains("//bazel/toolchain:atmega16m1_toolchain")
register_toolchains("//bazel/toolchain:atmega328p_toolchain")
