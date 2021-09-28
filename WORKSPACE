workspace(name = "formula")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

register_execution_platforms("@local_config_platform//:host", "//bazel/platforms:all")

register_toolchains("//bazel/toolchain:atmega16m1_toolchain")

register_toolchains("//bazel/toolchain:atmega64m1_toolchain")

register_toolchains("//bazel/toolchain:atmega328p_toolchain")

http_archive(
    name = "rules_python",
    sha256 = "cd6730ed53a002c56ce4e2f396ba3b3be262fd7cb68339f0377a45e8227fe332",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.5.0/rules_python-0.5.0.tar.gz",
)

load("@rules_python//python:pip.bzl", "pip_install")

# Buildifier formatter for Bazel

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "d1ffd055969c8f8d431e2d439813e42326961d0942bdf734d2c95dc30c369566",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.24.5/rules_go-v0.24.5.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")

gazelle_dependencies()

http_archive(
    name = "com_google_protobuf",
    sha256 = "bb1ddd8172b745cbdc75f06841bd9e7c9de0b3956397723d883423abfab8e176",
    strip_prefix = "protobuf-3.18.0",
    urls = ["https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.18.0.zip"],
)

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")

protobuf_deps()

http_archive(
    name = "com_github_bazelbuild_buildtools",
    strip_prefix = "buildtools-master",
    url = "https://github.com/bazelbuild/buildtools/archive/master.zip",
)

# CMocka

http_archive(
    name = "cmocka",
    build_file = "@//third_party/cmocka:BUILD",
    sha256 = "f0ccd8242d55e2fd74b16ba518359151f6f8383ff8aef4976e48393f77bba8b6",
    strip_prefix = "cmocka-1.1.5",
    urls = ["https://cmocka.org/files/1.1/cmocka-1.1.5.tar.xz"],
)

http_archive(
    name = "bazel_toolchains",
    sha256 = "1adf5db506a7e3c465a26988514cfc3971af6d5b3c2218925cd6e71ee443fc3f",
    strip_prefix = "bazel-toolchains-4.0.0",
    urls = [
        "https://github.com/bazelbuild/bazel-toolchains/releases/download/4.0.0/bazel-toolchains-4.0.0.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-toolchains/releases/download/4.0.0/bazel-toolchains-4.0.0.tar.gz",
    ],
)

http_archive(
    name = "cantools_",
    build_file = "@//third_party/cantools:BUILD",
    sha256 = "0f240c9e07d08104637d591a2d67a2bad123ce4cf2bc92e48cb2c68595994853",
    strip_prefix = "cantools-37.0.1-bazel",
    urls = [
        "https://github.com/jack-greenberg/cantools/archive/refs/tags/37.0.1-bazel.tar.gz",
    ],
)

pip_install(
    name = "cantools_deps",
    requirements = "@cantools_//:requirements.txt",
)

pip_install(
    name = "pytest_deps",
    requirements = "//tools/pytest:requirements.txt",
)

pip_install(
    name = "hitl_deps",
    requirements = "//projects/hitl/software:requirements.txt",
)

http_archive(
    name = "hedron_compile_commands",
    sha256 = "ce5714be202e942ba5f404d1c373a2fbb4b88c66737a924491fbd49afa91d48b",
    strip_prefix = "bazel-compile-commands-extractor-140666077ab4ca7f10041080e8b55cf641c07d30",
    url = "https://github.com/hedronvision/bazel-compile-commands-extractor/archive/140666077ab4ca7f10041080e8b55cf641c07d30.tar.gz",
)

load("@hedron_compile_commands//:workspace_setup.bzl", "hedron_compile_commands_setup")

hedron_compile_commands_setup()

# Log (C logging library)

http_archive(
    name = "log",
    build_file = "@//third_party/log:BUILD",
    strip_prefix = "log.c-master",
    url = "https://github.com/rxi/log.c/archive/refs/heads/master.zip",
)
