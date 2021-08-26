load(":avr.bzl", "create_avr_toolchain")
load(":linux.bzl", "create_linux_toolchain")

package(
    default_visibility = ["//visibility:public"],
)

create_avr_toolchain("atmega16m1", "4000000")

create_avr_toolchain("atmega328p", "16000000")

create_linux_toolchain()
