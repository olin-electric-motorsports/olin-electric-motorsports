load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def _cantools_impl(ctx):
    http_archive(
        name = "cantools_",
        sha256 = "0f240c9e07d08104637d591a2d67a2bad123ce4cf2bc92e48cb2c68595994853",
        strip_prefix = "cantools-37.0.1-bazel",
        urls = [
            "https://github.com/jack-greenberg/cantools/archive/refs/tags/37.0.1-bazel.tar.gz",
        ],
        build_file = "//third_party/cantools:BUILD",
        repo_mapping = ctx.attr.pip_dependencies,,
    )

cantools_extension = module_extension(implementation = _cantools_impl, attrs = {"pip_dependencies": attr.repo_mapping()})