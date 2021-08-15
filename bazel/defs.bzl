# bin_file = rule()
# hex_file = rule()
# eep_file = rule()
# size_file = rule()
# nm_file = rule()
# flash = rule()

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

    # Generates .hex file

    # Generates .eep file

    # Generates flash script
