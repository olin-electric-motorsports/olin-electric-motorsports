load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@rules_cc//cc:defs.bzl", "cc_binary")

### cc_firmware

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
        mnemonic = "GenerateEEP",
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

def _map_file_impl(ctx):
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
    args.add("-t")

    ctx.actions.run(
        mnemonic = "GenerateMap",
        executable = cc_toolchain.objdump_executable,
        arguments = [args],
        inputs = depset([input_file]),
        outputs = [output_file],
    )

    return [
        DefaultInfo(
            files = depset([output_file]),
        ),
    ]

_map_file = rule(
    implementation = _map_file_impl,
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
    template = ctx.file.template
    input_file = ctx.file.binary
    script = ctx.actions.declare_file("{}.sh".format(ctx.label.name))

    ctx.actions.expand_template(
        template = template,
        output = script,
        is_executable = True,
        substitutions = {
            "{part}": ctx.attr.part,
            "{binary}": input_file.short_path,
            "{config}": ctx.file.avr_config.path,
        },
    )

    return [
        DefaultInfo(
            executable = script,
            runfiles = ctx.runfiles(files = [
                ctx.file.binary,
                ctx.file.avr_config,
            ]),
        ),
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
        "avr_config": attr.label(
            doc = "Configuration file",
            allow_single_file = True,
            default = Label("//:.avrduderc"),
        ),
        "template": attr.label(
            doc = "Template file for flashing",
            allow_single_file = True,
            default = Label("//bazel/tools:avrdude.sh.tmpl"),
        ),
    },
    executable = True,
)

# Macro to generate all the proper files
def cc_firmware(name, **kwargs):
    # Generates .elf file
    cc_binary(
        name = "{}.elf".format(name),
        linkopts = select({
            "//bazel/constraints:atmega16m1": ["-T $(location //scripts/ldscripts:atmega16m1.ld)"],
            # Add more ldscripts here
            "//conditions:default": [],
        }),
        additional_linker_inputs = [
            "//scripts/ldscripts:atmega16m1.ld",
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

    # Generate .map file
    _map_file(
        name = "{}.map".format(name),
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
            "//bazel/constraints:atmega16m1": "16m1",
            "//bazel/constraints:atmega328p": "m328p",
            "//conditions:default": "",
        }),
    )

### kicad

def _kibot_impl(ctx):
    cfg_file = ctx.file.config_file
    sch = ctx.files.schematic_files
    pcb = ctx.file.pcb_file
    lib_cache = ctx.file.lib_cache

    output = ctx.actions.declare_file("{}".format(ctx.attr.name))

    ctx.actions.run_shell(
        mnemonic = "kibot",
        outputs = [output],
        inputs = [cfg_file, pcb, lib_cache] + sch,
        command = "kibot -e {} -b {} -c {} -d {} {}".format(
            sch[0].short_path,
            pcb.short_path,
            cfg_file.short_path,
            output.dirname,
            " ".join(ctx.attr.output_name),
        ),
    )

    return [
        DefaultInfo(files = depset([output])),
    ]

kibot = rule(
    implementation = _kibot_impl,
    attrs = {
        "config_file": attr.label(
            doc = "Path to config file",
            allow_single_file = True,
            mandatory = True,
        ),
        "output_name": attr.string_list(
            doc = "KiBot output name in script, default is `all`",
            allow_empty = False,
            default = ["all"],
        ),
        "schematic_files": attr.label_list(
            doc = "Schematic files",
            allow_files = True,
            allow_empty = False,
            mandatory = True,
        ),
        "pcb_file": attr.label(
            doc = "*.kicad-pcb file with layout",
            allow_single_file = True,
            mandatory = True,
        ),
        "lib_cache": attr.label(
            doc = "*-cache.lib file with the library cache",
            allow_single_file = True,
            mandatory = True,
        ),
    },
)

def kicad_hardware(
        name,
        project_file = "",
        schematic_files = [],
        lib_cache = "",
        pcb_file = ""):
    """
    Generates KiCad file artifacts using KiBot.

    Currently, `name` __must__ be the same name as your `.pro` file that KiCad
    generates due to a limitation of the software. This may be resolved in a
    future commit.

    Example:

    ```
    # vehicle/mkv/hardware/lvbox/bspd/BUILD

    kicad_hardware(
        name = "bspd_brakelight",
    )
    ```

    This can then be built using:

    ```
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd # builds all targets
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight.csv # builds BoM CSV
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight.pdf # builds schematic PDF
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight_sch.svg # builds schematic SVG
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight_a_top_pcb.svg # builds top of PCB as SVG
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight_a_bottom_pcb.svg # builds bottom of PCB as SVG
    $ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight.gerbers.zip # builds zip file with GERBERs and drill file
    ```
    """

    if not project_file:
        project_file = ":{}.pro".format(name)

    if not schematic_files:
        schematic_files = [":{}.sch".format(name)]

    if not pcb_file:
        pcb_file = ":{}.kicad_pcb".format(name)

    if not lib_cache:
        lib_cache = ":{}-cache.lib".format(name)

    pkg_tar(
        name = "{}".format(name),
        srcs = [
            ":{}_a_top_pcb.svg".format(name),
            ":{}_b_bottom_pcb.svg".format(name),
            ":{}_sch.svg".format(name),
            ":{}.pdf".format(name),
            ":{}.csv".format(name),
            # ":{}.step".format(name),
        ],
        extension = "tgz",
        mode = "0755",
        tags = ["kicad"],
    )

    kibot(
        name = "{}_a_top_pcb.svg".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["pcb_svg_top"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        lib_cache = lib_cache,
        tags = ["kicad"],
    )

    kibot(
        name = "{}_b_bottom_pcb.svg".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["pcb_svg_bottom"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        lib_cache = lib_cache,
        tags = ["kicad"],
    )

    kibot(
        name = "{}_sch.svg".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["sch_svg"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        lib_cache = lib_cache,
        tags = ["kicad"],
    )

    kibot(
        name = "{}.pdf".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["sch_pdf"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        lib_cache = lib_cache,
        tags = ["kicad"],
    )

    kibot(
        name = "{}.csv".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["bom"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        lib_cache = lib_cache,
        tags = ["kicad"],
    )

    # Once 3D modles are sorted out, this will be uncommented
    # kibot(
    #     name = "{}.step".format(name),
    #     config_file = "//scripts/kibot:build.kibot.yaml",
    #     output_name = ["step"],
    #     pcb_file = pcb_file,
    #     schematic_files = schematic_files,
    #     lib_cache = lib_cache,
    #     tags = ["kicad"],
    # )
