load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")

def _hex_file_impl(ctx):
    # ctx.file contains a single File or None for dependency attributes whose
    # specs set allow_single_file=True
    # (https://docs.bazel.build/versions/main/skylark/rules.html)
    input_file = ctx.file.elf

    cc_toolchain = find_cpp_toolchain(ctx)

    # Declares an output file with the name `label`.bin
    output_file = ctx.actions.declare_file(ctx.label.name)

    # Declare a set of commandline args
    args = ctx.actions.args()
    args.add(input_file)
    args.add(output_file)
    args.add("-O", "ihex") # Output a binary
    args.add("-R", ".eeprom") # Don't include .eeprom

    ctx.actions.run(
        mnemonic = "GenerateHex",
        executable = cc_toolchain.objcopy_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file])
        ),
    ]

_hex_file = rule(
    implementation = _hex_file_impl,
    attrs = {
        "elf": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "_cc_toolchain": attr.label(
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")
        ),
    },
    executable = False,
    toolchains = [
        "@bazel_tools//tools/cpp:toolchain_type",
    ],
    incompatible_use_toolchain_transition = True,
    fragments = ["cpp"],
)

def _bin_file_impl(ctx):
    # ctx.file contains a single File or None for dependency attributes whose
    # specs set allow_single_file=True
    # (https://docs.bazel.build/versions/main/skylark/rules.html)
    input_file = ctx.file.elf

    cc_toolchain = find_cpp_toolchain(ctx)

    # Declares an output file with the name `label`.bin
    output_file = ctx.actions.declare_file(ctx.label.name)

    # Declare a set of commandline args
    args = ctx.actions.args()
    args.add(input_file)
    args.add(output_file)
    args.add("-O", "binary") # Output a binary
    args.add("-R", ".eeprom") # Don't include .eeprom

    ctx.actions.run(
        mnemonic = "GenerateBinary",
        executable = cc_toolchain.objcopy_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file])
        ),
    ]

_bin_file = rule(
    implementation = _bin_file_impl,
    attrs = {
        "elf": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "_cc_toolchain": attr.label(
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain")
        ),

        # TODO: (@jack-greenberg) Integrate btldr
        # "_patch_header": attr.label(
        #     default = Label("//tools:patch_image_header"),
        # )
    },
    executable = False,
    toolchains = [
        "@bazel_tools//tools/cpp:toolchain_type",
    ],
    incompatible_use_toolchain_transition = True,
    fragments = ["cpp"],
)

# Macro to generate all the proper files
def cc_firmware(
    name,
    **kwargs
):
    # Generates .elf file
    native.cc_binary(
        name=name,
        **kwargs,
    )

    # Generates .bin file
    _bin_file(
        name = "{}.bin".format(name),
        elf = ":{}".format(name),
    )

    # Generates .hex file
    _hex_file(
        name = "{}.hex".format(name),
        elf = ":{}".format(name),
    )

    # Generates .eep file

    # Generates flash script
