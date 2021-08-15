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
    "AvrGetCommonFeatures",
)

_path = "/usr/bin/"
_prefix = "avr-"

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

    ft = AvrGetCommonFeatures(ctx.attr.device, ctx.attr.frequency)

    return cc_common.create_cc_toolchain_config_info(
        ctx = ctx,
        toolchain_identifier = ctx.attr.toolchain_identifier,
        host_system_name = "local",
        target_system_name = "avr",
        target_cpu = "avr",
        target_libc = "unknown",
        compiler = "avr-gcc",
        abi_version = "unknown",
        abi_libc_version = "unknown",
        tool_paths = tool_paths,
        cxx_builtin_include_directories = [
            "/usr/lib/avr/include",
            "/usr/lib/gcc/avr/5.4.0/include",
            "/usr/lib/gcc/avr/5.4.0/include-fixed",
        ],
        features = [
            ft.all_warnings,
            ft.all_warnings_as_errors,
            ft.dbg,
            ft.opt,
            ft.device,
        ],
    )

# Rule to create a toolchain config
avr_toolchain_config = rule(
    implementation = _impl,
    provides = [CcToolchainConfigInfo],
    attrs = {
        "toolchain_identifier": attr.string(
            mandatory = True,
            doc = "Identifier used by the toolchain, this should be consistent with the cc_toolchain rule attribute",
        ),
        "device": attr.string(
            mandatory = True,
            doc = "Device to compile for, like the ATMega16m1",
        ),
        "frequency": attr.string(
            mandatory = True,
            doc = "CPU frequency for device",
        ),
    },
)

# Creates a toolchain for a specific device
def create_avr_toolchain(device, frequency):
    native.filegroup(name = device + "_files")

    avr_toolchain_config(
        name = device + "-toolchain-config",
        toolchain_identifier = device + "-toolchain",
        device = device,
        frequency = frequency,
    )

    native.cc_toolchain(
        name = "_" + device + "_toolchain",
        all_files = device + "_files",
        compiler_files = device + "_files",
        dwp_files = device + "_files",
        objcopy_files = device + "_files",
        strip_files = device + "_files",
        linker_files = device + "_files",
        toolchain_config = ":" + device + "-toolchain-config",
        toolchain_identifier = "avr-toolchain",
        supports_param_files = 1,
    )

    native.toolchain(
        name = device + "_toolchain",
        toolchain = ":_" + device + "_toolchain",
        target_compatible_with = [
            "//bazel/constraints:avr",
            "//bazel/constraints:" + device,
        ],
        toolchain_type = "@bazel_tools//tools/cpp:toolchain_type",
    )
