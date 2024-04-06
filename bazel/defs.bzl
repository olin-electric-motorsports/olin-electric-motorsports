load("@bazel_tools//tools/cpp:toolchain_utils.bzl", "find_cpp_toolchain")
load("@bazel_tools//tools/build_defs/pkg:pkg.bzl", "pkg_tar")
load("@bazel_embedded//tools/openocd:defs.bzl", "openocd_flash")
load("@rules_cc//cc:defs.bzl", "cc_binary")
load("//projects/btldr:ecus.bzl", "ECUS")

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
    args.add("-j", ".eeprom")  # Only include eeprom
    args.add("--change-section-lma", ".eeprom=0")  # Reset load address to zero
    args.add("--set-section-flags=.eeprom=alloc,load")
    args.add("-O", "ihex")  # Output a hex file

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

    if ctx.file.btldr:
        runfiles = ctx.runfiles(files = [
            ctx.file.binary,
            ctx.file.avr_config,
            ctx.file.btldr,
            ctx.file.eeprom,
        ])

        ctx.actions.expand_template(
            template = template,
            output = script,
            is_executable = True,
            substitutions = {
                "{part}": ctx.attr.part,
                "{binary}": input_file.short_path,
                "{config}": ctx.file.avr_config.path,
                "{eeprom}": ctx.file.eeprom.short_path,
                "{btldr}": ctx.file.btldr.short_path,
            },
        )
    else:
        runfiles = ctx.runfiles(files = [
            ctx.file.binary,
            ctx.file.avr_config,
        ])

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
            runfiles = runfiles,
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
        "eeprom": attr.label(
            doc = "EEPROM file",
            mandatory = False,
            allow_single_file = True,
        ),
        "btldr": attr.label(
            doc = "Hex file for btldr",
            mandatory = False,
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

# Generate .bin and .hex files for arm platform
def _bin_file_arm(name, srcs):
    native.genrule(
        name = "gen_{}".format(name),
        srcs = srcs,
        outs = [name],
        cmd = "$(execpath @arm_none_eabi//:objcopy) -O binary $< $@",
        tools = ["@arm_none_eabi//:objcopy"],
    )
    return [
        DefaultInfo(
            files = depset([name]),
        ),
    ]

def _hex_file_arm(name, srcs):
    native.genrule(
        name = "gen_{}".format(name),
        srcs = srcs,
        outs = [name],
        cmd = "$(execpath @arm_none_eabi//:objcopy) -O ihex $< $@",
        tools = ["@arm_none_eabi//:objcopy"],
    )
    return [
        DefaultInfo(
            files = depset([name]),
        ),
    ]

def _flash_arm(name, image):
    return openocd_flash(
        name = name,
        device_configs = [
            "target/stm32f1x.cfg",
        ],
        image = image,
        interface_configs = [
            "interface/stlink.cfg",
        ],
        transport = "hla_swd",
    )

# Macro to generate all the proper files
def cc_firmware(name, **kwargs):
    # Generates .elf file

    data = []
    if kwargs.get("data"):
        data = kwargs.pop("data")

    defines = []
    if kwargs.get("defines"):
        defines = kwargs.pop("defines")

    copts = []
    if kwargs.get("copts"):
        copts = kwargs.pop("copts")

    linkopts = []
    if kwargs.get("linkopts"):
        linkopts = kwargs.pop("linkopts")

    is_btldr = False
    if kwargs.get("is_btldr"):
        # This is a btldr binary
        is_btldr = True
        kwargs.pop("is_btldr")
    else:
        # If not a btldr binary, make sure to garbage collect unused sections
        linkopts.append("-Wl,--gc-sections")

    btldr = None
    if kwargs.get("btldr"):
        btldr = kwargs.pop("btldr")
        btldr_ecu_name = btldr.removeprefix("//projects/btldr:").removesuffix("_btldr")
        linkopts.append("-flto")
        data.append(btldr + ".hex")
        defines.append("BTLDR_ID=" + ECUS[btldr_ecu_name]["btldr_id"])

    cc_binary(
        name = "{}.elf".format(name),
        linkopts = linkopts + select({
            "//bazel/constraints:atmega16m1": ["-T $(location //scripts/ldscripts:atmega16m1.ld)"],
            "//bazel/constraints:atmega64m1": ["-T $(location //scripts/ldscripts:atmega64m1.ld)"],
            # Add more ldscripts here
            "//conditions:default": [],
        }),
        additional_linker_inputs = [
            "//scripts/ldscripts:atmega16m1.ld",
            "//scripts/ldscripts:atmega64m1.ld",
        ],
        copts = copts + select({
            "//bazel/constraints:hitl": ["-DBOARD_FIRMWARE_TEST"],
            "//bazel/constraints:hackerboard": ["-DBOARD_HACKERBOARD"],
            "//conditions:default": [],
        }),
        defines = defines,
        data = data,
        **kwargs
    )

    # Generates .bin file
    _bin_file(
        name = "{}.bin".format(name),
        elf = ":{}.elf".format(name),
        visibility = ["//visibility:public"],  # Used for btldr
    )

    # Generates .hex file
    _hex_file(
        name = "{}.hex".format(name),
        elf = ":{}.elf".format(name),
        visibility = ["//visibility:public"],  # Used for btldr
    )

    # Generates .eep file
    _eep_file(
        name = "{}.eep".format(name),
        elf = ":{}.elf".format(name),
        visibility = ["//visibility:public"],  # Used for btldr
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
    # Invoke with `bazel run --config=16m1 //path/to:target -- -c usbasp`

    bin_file = ":{}.bin".format(name)
    btldr_hex = None
    eeprom = None
    template = "//bazel/tools:avrdude.sh.tmpl"

    if btldr:
        native.py_binary(
            name = "can_flash",
            srcs = [
                "//bazel/tools:can_flash.py",
            ],
            deps = [
                "//projects/btldr/py_client:updatr",
            ],
            env = {
                "BTLDR_ID": ECUS[name]["btldr_id"],
                "TARGET_BINARY": "$(location {}_patched_bin)".format(name),
            },
            data = [
                "{}_patched_bin".format(name),
            ],
        )

        native.genrule(
            name = "{}_patched_bin".format(name),
            srcs = [
                "{}.bin".format(name),
            ],
            outs = [
                "{}_patched.bin".format(name),
            ],
            tools = [
                "//projects/btldr/tools:patch_header",
            ],
            cmd = "$(location //projects/btldr/tools:patch_header) $(SRCS) $(OUTS)",
        )
        bin_file = ":{}_patched.bin".format(name)
        btldr_hex = "//projects/btldr:{}_btldr.hex".format(name)
        eeprom = "//projects/btldr:{}_btldr.eep".format(name)
        template = "//bazel/tools:avrdude-btldr.sh.tmpl"

    _flash(
        name = name,
        binary = bin_file,
        eeprom = eeprom,
        btldr = btldr_hex,
        method = select({
            "//bazel/constraints:avr": "avrdude",
            "//conditions:default": "",
        }),
        template = template,
        part = select({
            "//bazel/constraints:atmega16m1": "16m1",
            "//bazel/constraints:atmega328p": "m328p",
            "//bazel/constraints:atmega64m1": "64m1",
            "//conditions:default": "",
        }),
    )

def cc_arm_firmware(name, **kwargs):
    # Generates .elf file
    data = []
    if kwargs.get("data"):
        data = kwargs.pop("data")

    defines = []
    if kwargs.get("defines"):
        defines = kwargs.pop("defines")

    copts = []
    if kwargs.get("copts"):
        copts = kwargs.pop("copts")

    linkopts = []
    if kwargs.get("linkopts"):
        linkopts = kwargs.pop("linkopts")

    cc_binary(
        name = "{}.elf".format(name),
        linkopts = linkopts + select({
            "//bazel/constraints:stm32f103rbt6": ["-T $(location //scripts/ldscripts:stm32f103rbt6.ld)", "-Os", "-std=c99", "-ggdb3", "-mcpu=cortex-m3", "-mthumb", "-msoft-float", "-fno-common", "-ffunction-sections", "-fdata-sections", "-Wextra", "-Wshadow", "-Wno-unused-variable", "-Wimplicit-function-declaration", "-Wredundant-decls", "-Wstrict-prototypes", "-Wmissing-prototypes", "-MD", "-Wall", "-Wundef", "-nostartfiles", "-mcpu=cortex-m3", "-mthumb", "-msoft-float", "-specs=nano.specs", "-Wl,--gc-sections", "-Wl,--start-group", "-lc", "-lgcc", "-lnosys", "-Wl,--end-group"],
            # Add more ldscripts here
            "//conditions:default": [],
        }),
        additional_linker_inputs = [
            "//scripts/ldscripts:stm32f103rbt6.ld",
        ],
        copts = copts + select({
            "//bazel/constraints:stm32f103rbt6": ["-mthumb", "-mcpu=cortex-m3", "-mlittle-endian", "-mthumb-interwork"],
            "//conditions:default": [],
        }),
        defines = defines,
        data = data,
        **kwargs
    )

    # Generates .bin file
    _bin_file_arm(
        name = "{}.bin".format(name),
        srcs = [":{}.elf".format(name)],
    )

    # Generates .hex file
    _hex_file_arm(
        name = "{}.hex".format(name),
        srcs = [":{}.elf".format(name)],
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
    bin_file = ":{}.bin".format(name)
    btldr_hex = None
    eeprom = None
    template = "//bazel/tools:avrdude.sh.tmpl"

    _flash_arm(
        name = name,
        image = bin_file,
    )

### kicad

def _kibot_impl(ctx):
    cfg_file = ctx.file.config_file
    sch = ctx.files.schematic_files
    pcb = ctx.file.pcb_file

    output = ctx.actions.declare_file("{}".format(ctx.attr.name))

    ctx.actions.run_shell(
        mnemonic = "kibot",
        outputs = [output],
        inputs = [cfg_file, pcb] + sch,
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
            doc = "*.kicad_pcb file with layout",
            allow_single_file = True,
            mandatory = True,
        ),
    },
)

def kicad_hardware(
        name,
        project_file = "",
        schematic_files = [],
        pcb_file = ""):
    """
    Generates KiCad file artifacts using KiBot.

    Currently, `name` __must__ be the same name as your `.kicad_pro` file that KiCad
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
        project_file = ":{}.kicad_pro".format(name)

    if not schematic_files:
        schematic_files = [":{}.kicad_sch".format(name)]

    if not pcb_file:
        pcb_file = ":{}.kicad_pcb".format(name)

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
        tags = ["kicad"],
    )

    kibot(
        name = "{}_b_bottom_pcb.svg".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["pcb_svg_bottom"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        tags = ["kicad"],
    )

    kibot(
        name = "{}_sch.svg".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["sch_svg"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        tags = ["kicad"],
    )

    kibot(
        name = "{}.pdf".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["sch_pdf"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        tags = ["kicad"],
    )

    kibot(
        name = "{}.csv".format(name),
        config_file = "//scripts/kibot:build.kibot.yaml",
        output_name = ["bom"],
        pcb_file = pcb_file,
        schematic_files = schematic_files,
        tags = ["kicad"],
    )

    # Once 3D modles are sorted out, this will be uncommented
    # kibot(
    #     name = "{}.step".format(name),
    #     config_file = "//scripts/kibot:build.kibot.yaml",
    #     output_name = ["step"],
    #     pcb_file = pcb_file,
    #     schematic_files = schematic_files,
    #     tags = ["kicad"],
    # )
