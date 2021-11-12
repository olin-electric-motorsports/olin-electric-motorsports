# can_api

# TODOs

As of 10/25: For this PR:

- Write full DBC-generator [x]
- Cleanup, resolve all relative paths and make artifacts have a consistent
  folder to live in [x]
- Add documentation and docstrings
- Complete main script MVP
- Make sure that generated can_api.c can compile and run
- Bazel integration
- can API integration

Later PRs:

- Convert current address space to mini-YAML files
- Implement reserved Message ID handling (make a YAML with reserved IDs) [x]
- Preserve unchanged IDs unless specific override is passed when doing priority
  assignments
- Implement RX message handling
  - Append RX message definitions to generated mini-yamls
- test C code with a hackerboard
- Make sure that generated files do not get out of sync

## Creating a Mini-YAML

1. Add your new mini-YAML to `files/mini_yamls`. Give it a unique name that
   corresponds to the purpose/functionality of the chip that will be sending CAN
   messages.
2. The structure of your mini-YAML is as follows:

```
chip: CHIPNAME -- should be short, unique, and capitalized. This will prefix all messages sent by the chip
receives: CHIP1_msg1, CHIP2_another_message  --a comma separated list of messages that the chip will receive
MessagesTX:
  CHIPNAME_msg_name:   --the full name of the message. Every message should start with the prefix, and use underscores
    cycle_time:    -- time between cycles


```

```[yaml]
chip: AIR
receives: BMS_core
MessagesTX:
  AIR_ctrl:
    cycle_time: 100
    priority: MED
    data_bytes: 8.0
    signals:
      tsms_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      imd_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      main_pack_(tsconn)_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      connector_to_hvd_(hvdconn)_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      hvd_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      bms_sense:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      imd_status:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit
      bms_status:
        length: 8
        scale: 1
        offset: 0
        min: 0
        max: 1
        unit: bit

```
