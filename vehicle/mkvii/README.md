# MKVII

The development of boards for the Mark VII car will go in this folder.
Here's to a great year everyone!

Rev. 1: Hardware complete as of 3/9/2025! Subteam folders have their boards inside.
Rev. 2: Software build-out in progress. As of 3/9/2025 the basic folder structure exists!


Useful commands:
1. Setting up a CANnable: `sudo ip link set can0 up type can bitrate 500000`
2. Dumping all CAN commands: `candump can0`
3. Dumping specific commands with a specific address (XXX): `candump can0,XXX:7ff`
4. Quickly viewing many CAN messages in a readable way: `cansniffer can0`
5. using canviewer: `bazel run //projects/canviewer -- -b socketcan -c can0`
6. Flashing an ATMEGA: `SET_FUSES=1 bazel run --config=16m1 -c opt //examples/blinky -- -c usbasp` IF FLASH FAILS, BOARD IS MADE INCORRECTLY. Use `usbasp` for the small programmers, `avrispmkII` for the large blue ones. SET_FUSES=1 required for first flash only.