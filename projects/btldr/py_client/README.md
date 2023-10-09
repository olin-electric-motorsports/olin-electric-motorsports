# Btldr Python Client

Hello! I hope this document is helpful for anyone down the road who might be
working on the btldr. If you are, feel free to drop me a line to let me know how
it's going (j@jackgreenberg.co).

This document covers the design for the Python client for the btldr system. If
you are looking for documentation of the design of the btldr itself, you should
check on [Coda], or whatever your current documentation platform for the team
is.

[Coda]: https://coda.io/d/Documentation_dbuFnC2EA_e/CAN-Software-Update-aka-Bootloader_suPXB#_luxHd

This document might be a bit dense. Read it a couple times, and if there are
things that are unclear and there's no one that knows, feel free to reach out to
me (Jack) for help. My email is above :)

## System Design

The core of the client is the `btldr.py` file. This contains the `BtldrManager`
class. It should be pretty well-commented, but to provide a more concise source,
this class can be used to interact with a target device. Only one class needs to
be created for any program that uses it[^1]. You can use the methods `.ping()`
and `.flash()` to ping and flash the target device respectively. You can read
the doc strings associated with those functions for more detail.

[^1]: Examples of programs that might use this are the CLI (explained on this
  page) that an engineer can use to manually flash a target or a
  continuous-integration plugin that uses the btldr to update the firmware of a
  board and then uses the hardware-in-the-loop tester (HitL) to test it.

The next piece to the design is the `BtldrDatabase` in the `btldr_database.py`
file. This creates a CAN DBC object that only contains eight messages--the eight
messages that the btldr uses for communication. By default, the IDs of the CAN
messages are *just* the offset of the message. That was a confusing sentence.

For example, the `reset_response` message sent from the target (microcontroller)
to the host (the computer) has a message offset of 5. So for AIR Control, which
has an ECU_ID of 0x700, the `air_control_reset_response` message has a CAN ID of
`0x700 + 5 = 0x705`.

By default, when you create the BtldrDatabase, it keeps the eight message IDs as
the numbers 0-7. However, when initializing the class, you can pass in an
`ecu_id` parameter, which will update the message ids to be `ecu_id + offset`.
This is useful in the event that you want to use the BtldrDatabase to decode
incoming messages.

## Implementation example: CLI

I've also created a command-line interface (CLI), which provides a useful tool
for engineers to manually use the btldr system, but also provides a good example
of usage of the btldr Python client. The CLI is called `updatr`.

Here are some examples of use:

```sh 
updatr -d can0 ping 0x700

updatr -d can0 flash 0x700 \
    bazel-bin/vehicle/mkvi/software/air_control/air_control_patched.bin
```

As you can see, it has very similar usage/features to the BtldrManager, which is
because it's basically just a wrapper for it! The CLI uses a Python library
called Click, which is used to create the command-line interface. It's a great
library with fantastic documentation--check it out.

I recommend using this file as an example of how to use the BtldrManager if you
are using it for a project of your own.
