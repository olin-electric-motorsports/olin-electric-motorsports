load(
    "@bazel_tools//tools/cpp:cc_toolchain_config_lib.bzl",
    "feature",
    "flag_group",
    "flag_set",
    "tool_path",
)
load("@bazel_tools//tools/build_defs/cc:action_names.bzl", "ACTION_NAMES")
load("@rules_cc//cc:defs.bzl", "cc_toolchain")
load(
    "//bazel/toolchain:features.bzl",
    "LinuxGetCommonFeatures",
)

_path = "/usr/bin/"
_prefix = ""

def _impl(ctx):
    tool_paths = [
        tool_path(
            name = "gcc",
            path = _path + _prefix + "gcc",
        ),
        tool_path(
            name = "ld",
            path = _path + _prefix + "ld",
        ),
        tool_path(
            name = "ar",
            path = _path + _prefix + "ar",
        ),
        tool_path(
            name = "cpp",
            path = _path + _prefix + "cpp",
        ),
        tool_path(
            name = "gcov",
            path = _path + _prefix + "gcov",
        ),
        tool_path(
            name = "nm",
            path = _path + _prefix + "nm",
        ),
        tool_path(
            name = "size",
            path = _path + _prefix + "size",
        ),
        tool_path(
            name = "objcopy",
            path = _path + _prefix + "objcopy",
        ),
        tool_path(
            name = "objdump",
            path = _path + _prefix + "objdump",
        ),
        tool_path(
            name = "strip",
            path = _path + _prefix + "strip",
        ),
    ]

    ft = LinuxGetCommonFeatures()

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = ctx.attr.toolchain_identifier,
        host_system_name = "local",
        target_system_name = "linux",
        target_cpu = "x86_64",
        target_libc = "2.3.1",
        compiler = "gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        cxx_builtin_include_directories = [
            "/usr/include",
            "/usr/lib/gcc/x86_64-linux-gnu/include",
        ],
        features = [
            ft.all_warnings,
            ft.all_warnings_as_errors,
            ft.dbg,
            ft.opt,
        ],
    )

# Rule to create a toolchain config
linux_toolchain_config = rule(
    implementation = _impl,
    provides = [CcToolchainConfigInfo],
    attrs = {
        "toolchain_identifier": attr.string(
            mandatory = True,
            doc = "Identifier used by the toolchain, this should be consistent with the cc_toolchain rule attribute",
        ),
    },
)

def create_linux_toolchain():
    native.filegroup(name = "linux_files")

    linux_toolchain_config(
        name = "linux-toolchain-config",
        toolchain_identifier = "linux-toolchain"
    )

    native.cc_toolchain(
        name = "_linux_toolchain",
        all_files = "linux_files",
        compiler_files = "linux_files",
        dwp_files = "linux_files",
        objcopy_files = "linux_files",
        strip_files = "linux_files",
        linker_files = "linux_files",
        toolchain_config = ":linux-toolchain-config",
        toolchain_identifier = "linux-toolchain",
    )

    native.toolchain(
        name = "linux_toolchain",
        toolchain = ":_linux_toolchain",
        target_compatible_with = [
            "//bazel/constraints:test_sim",
        ],
        toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    )
