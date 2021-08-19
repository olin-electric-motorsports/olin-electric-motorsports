load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")

def _eep_file_impl(ctx):
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
    args.add("-O", "ihex")  # Output a binary
    args.add("-j", ".eeprom")  # Don't include .eeprom
    args.add("--change-section-lma", ".eeprom=0")
    args.add("--set-section-flags=.eeprom=alloc,load")

    ctx.actions.run(
        mnemonic = "GenerateHex",
        executable = cc_toolchain.objcopy_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file]),
        ),
    ]

_eep_file = rule(
    implementation = _eep_file_impl,
    attrs = {
        "elf": attr.label(
            mandatory = True,
            allow_single_file = True,
        ),
        "_cc_toolchain": attr.label(
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain"),
        ),
    },
    executable = False,
    toolchains = [
        "@bazel_tools//tools/cpp:toolchain_type",
    ],
    incompatible_use_toolchain_transition = True,
    fragments = ["cpp"],
)

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
    args.add("-O", "ihex")  # Output a binary
    args.add("-R", ".eeprom")  # Don't include .eeprom

    ctx.actions.run(
        mnemonic = "GenerateHex",
        executable = cc_toolchain.objcopy_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file]),
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
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain"),
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
    args.add("-O", "binary")  # Output a binary
    args.add("-R", ".eeprom")  # Don't include .eeprom

    ctx.actions.run(
        mnemonic = "GenerateBinary",
        executable = cc_toolchain.objcopy_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file]),
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
            default = Label("@bazel_tools//tools/cpp:current_cc_toolchain"),
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

def _flash_impl(ctx):
    template = """#!/bin/bash

if [ -z $(SET_FUSES+x) ]; then
FUSE_OP = w
else
FUSE_OP = v
fi

_LFUSE=$(LFUSE:=0x65)
_HFUSE=$(HFUSE:=0xD8)
_EFUSE=$(EFUSE:=0xFE)

if [ -z $(DEBUG+x) ]; then
printf "FUSE_OP: $(FUSE_OP)\\n"
printf "  LFUSE: $(_LFUSE)\\n"
printf "  HFUSE: $(_HFUSE)\\n"
printf "  EFUSE: $(_EFUSE)\\n"

avrdude -v -P usb -p {part} \\
        -U lfuse:$(FUSE_OP):$(_LFUSE):m \\
        -U hfuse:$(FUSE_OP):$(_HFUSE):m \\
        -U efuse:$(FUSE_OP):$(_EFUSE):m \\
        -U flash:w:{binary}:r \\
        $@
"""

    input_file = ctx.file.binary

    script = ctx.actions.declare_file("{}.sh".format(ctx.label.name))

    script_body = template.format(
        part = ctx.attr.part,
        binary = input_file.short_path,
    )

    ctx.actions.write(
        output = script,
        content = script_body,
        is_executable = True,
    )

    return [
        DefaultInfo(executable = script),
    ]

_flash = rule(
    implementation = _flash_impl,
    attrs = {
        # "pkg": attr.label(
        #     doc = "tgz file for flashing",
        #     mandatory = True,
        #     allow_single_file = True,
        # ),
        "binary": attr.label(
            doc = "Binary file for flashing",
            mandatory = True,
            allow_single_file = True,
        ),
        "method": attr.string(
            doc = "Flashing tool",
            mandatory = True,
        ),
        "part": attr.string(
            doc = "Part name for avrdude",
            mandatory = True,
        ),
    },
    executable = True,
)

# Macro to generate all the proper files
def cc_firmware(
        name,
        **kwargs):
    # Generates .elf file
    native.cc_binary(
        name = "{}.elf".format(name),
        linkopts = select({
            "//bazel/constraints:atmega16m1": ["-T $(location //scripts/ldscripts:atmega16m1.ld)"],
            # Add more ldscripts here
            "//conditions:default": [],
        }),
        deps = [
            "//scripts/ldscripts:atmega16m1.ld",
            # Add the ldscripts here too
        ],
        **kwargs
    )

    # Generates .bin file
    _bin_file(
        name = "{}.bin".format(name),
        elf = ":{}.elf".format(name),
    )

    # Generates .hex file
    _hex_file(
        name = "{}.hex".format(name),
        elf = ":{}.elf".format(name),
    )

    # Generates .eep file
    _eep_file(
        name = "{}.eep".format(name),
        elf = ":{}.elf".format(name),
    )

    # Generates tarball file with all
    pkg_tar(
        name = "{}.tgz".format(name),
        extension = "tgz",
        srcs = [
            ":{}.elf".format(name),
            ":{}.hex".format(name),
            ":{}.bin".format(name),
            ":{}.eep".format(name),
        ],
    )

    # Generates flash script
    # Invoke with `bazel build --config=16m1 //path/to:target -- -c usbasp`
    _flash(
        name = name,
        binary = "{}.bin".format(name),
        method = select({
            "//bazel/constraints:avr": "avrdude",
            "//conditions:default": "",
        }),
        part = select({
            "//bazel/constraints:atmega16m1": "m16",
            "//bazel/constraints:atmega328p": "m328p",
            "//conditions:default": "",
        }),
    )
