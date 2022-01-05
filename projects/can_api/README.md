# Generated CAN API

The purpose of this project is to create a tool that automatically generates C
code that abstracts CANbus interaction for microcontrollers.

## Context

Before 2021, our team used a CAN API that allowed for sending byte-arrays with a
specified ID. In 2021, we developed a new library that used semantics of the C
language like structs and enums to develop a cleaner library that allowed for
initializing, sending, and receiving messages, with options for polling and
interrupts.

However, none of these specified the IDs or the contents of the messages. For
that, we used the MKx CAN Address Space, a Google Sheet that listed all of the
messages and all the different signals. This was the "single source of truth"
that all the application code referenced.

The new generated CAN API is a layer of abstraction that utilizes the CAN
library as a network layer. Messages and their signals are defined in YAML
files.

## Scope

The project is designed to be _robust_ and as _reusable_ as possible. Most of
the project is unit-tested. The backend of the project uses an external library
called [cantools](https://github.com/cantools/cantools), which is thoroughly
tested.

### Goals

* A DBC file can be generated from the individual YAML files
* All message collisions are detected before collisions are detected
* A `.c` and `.h` file are generated for each YAML file that include send and
  receive functions for each of the messages sent and received by the ECU as
  specified by the YAML file

### Non-goals

* _Getters_ and _setters_: Functions of these types are used to set the values
  of signals in a CAN message (like `set_bspd_brakelight_voltage(uint16_t
  voltage)`), but these functions aren't strictly necessary and can be more
  confusing, so we avoid them
* Message ID assignment: This could be a future goal, see __Future Work__ below

## Design

## Usage

To begin, we must define a YAML file for the ECU. As an example, we will use the
BMS ECU. The file we are writing will be in `vehicle/mkv/software/bms/bms.yml`.
We begin with the name of the node/ECU, _bms_:

```yaml
# vehicle/mkv/software/bms/bms.yml
name: bms  # Name of the ECU
```

Next we specify the messages received by the ECU. For example, the BMS should
receive the AIR Control Critical message, so we can specify the following:

```yaml
# All the received messages
subscribe:
  - name: air_control_critical
    mob: 1
```

This says that the BMS should listen for the `air_control_critical` message
(this name is specified as the `name` of a message in a different YAML file),
and that it should use message object (MOb) 1.

__Note that this code _only_ allows for receiving a specific CAN message per
MOb, not multiple. If you need to listen to a range of messages, don't use the
API.__

Now we specify the messages _sent_ by the ECU. Let's take the following row from
the MKV CAN Address Space as an example:

Name | ID | Length | Frequency (Hz) | Byte0 | Byte1 | Byte2 | Byte3 | Byte4 | Byte5 | Byte6 | Byte7
-----|--------|----------------|-------|-------|-------|-------|-------|-------|-------|------
BMS Core|0x10|8|16|Fault Code|Relay Status|Temperature|Pack Voltage|SOC Estimate|BMS OK|Current-limiting enabled|Cell-balancing status

The MKV CAN Address space specified that the minimum size of any signal is 1
byte. However, with our system, we can have signals that are smaller (like a
single bit). Here's how we might represent the message in a new way:

```yaml
publish: - name: bms_core
    id: 0x10
    freq_hz: 16
    signals:
      - name: fault_code
        slice: 0 + 8  # This is (start bit) + (length)
        unit:
          type: enum
          values:
            - NO_FAULT
            - FAULT_EXAMPLE_1
            - FAULT_EXAMPLE_2
            - ...
      - name: temperature
        slice: 8 + 8
        unit:
          type: uint8_t  # C-type that this is stored as
          name: degC  # Used for displaying when decoding information
          offset: 0  # Offset used to calculate the true value
          scale: 5 / 4096  # Scale used to calculate the true value
      - name: pack_voltage
        slice: 16 + 8
        unit:
          type: uint8_t
          name: V
          offset: 0
          scale: 1000
      - name: soc  # State of Charge
        slice: 24 + 8
        unit:
          type: uint8_t
          name: "%"
          offset: 0
          scale: 100 / 4096
      - name: relay_state
        slice: 32 + 1
        unit:
          type: bool  # Bool is used for any value where it is either 0 or 1
          values:
            t: Relay open  # String to display when value is true
            f: Relay closed  # When value is false
      - name: bms_ok
        slice: 33 + 1
        unit:
          type: bool  # Bool is used for any value where it is either 0 or 1
          values:
            t: BMS OK
            f: BMS NOT OK
      - name: current_limiting_enabled
        slice: 34 + 1
        unit:
          type: bool  # Bool is used for any value where it is either 0 or 1
          values:
            t: Current limiting enabled
            f: Current limiting disabled
      - name: cell_balancing_status
        slice: 35 + 1
        unit:
          type: bool  # Bool is used for any value where it is either 0 or 1
          values:
            t: Cell balancing active
            f: Cell balancing inactive
```

Notice that we have reordered some of the fields. This is because it is better
to group signals together if they are less than a byte so that they can be
"packed" together. If we had a 1-bit signal followed by an 8-bit signal followed
by a 1-bit, it would require at least 3 bytes of space since full bytes must be
aligned.

Now that we have our completed file, we can define our CAN API using Bazel. In
the `BUILD` file, we will load a rule and create a new target:

```python
# vehicle/mkv/software/bms/BUILD

load("//bazel/tools:defs.bzl", "can_api_files")

...

# Must include this
exports_files([
    "bspd.yml",
])

# Defines the CAN API library
can_api_files(
    name = "can_api",
    dbc = "//vehicle/mkv:mkv.dbc",
    yaml = ":bspd.yml",
)
```

In addition, we should add the BMS YAML file to the list of MKV YAML files in
`vehicle/mkv/BUILD`:

```python
# vehicle/mkv/BUILD
load("//bazel/tools:defs.bzl", "dbc_gen")

# Generates DBC
dbc_gen(
    name = "mkv.dbc",
    srcs = [
        "//vehicle/mkv/software/air_control:air.yml",
        "//vehicle/mkv/software/brakelight_bspd:bspd.yml",
        "//vehicle/mkv/software/motor_controller:motor_controller.dbc",

        # New
        "//vehicle/mkv/software/bms:bms.yml",
    ],
)
```

We do this so that we can use the DBC generator to link all of these YAML files
together into a single DBC.

Now that we have our CAN API created, we can test to make sure that it works:

```shell
$ bazel build //vehicle/mkv/software/bms:can_api
```

If this builds successfully, then the CAN API generation is working.

We can add `:can_api` to the `deps` field of our `cc_firmware` that defines the
BMS code. Then, in our BMS file, we can start using the API. The following
features are documented:

#### Setting signal values

In order to set the value of a signal, we use a struct. The CAN API generates a
struct whose fields are each of the signals of the message. For example, the
struct for the `bms_core` message defined above might look like:

```c
struct can_tools_bms_core_t {
    uint8_t fault_code;
    uint8_t temperature;
    uint8_t pack_voltage
    uint8_t soc;
    uint8_t relay_state;
    uint8_t bms_ok;
    uint8_t current_limiting_enabled;
    uint8_t cell_balancing_status;
};
```

__Note that even though the length of, for example, `relay_state` should be 1
according to the YAML, the struct will store it as a byte. This is because
before the message is sent using the `can_send` function, there is another,
private function that "packs" the message according to the correct lengths. So
the value of the `uint8_t relay_state` will be packed into a single bit when the
message is sent__.

The CAN API also defines a single variable of this type as `struct
can_tools_bms_core_t bms_core`. That way, you can access it like so:

```c
// Set the pack_voltage
bms_core.pack_voltage = get_pack_voltage();

// Set the relay_state
bms_core.relay_state = gpio_get_pin(BMS_RELAY);
```

This is the same variable that is used when sending the CAN message, so care
should be taken that there are no concurrency issues (say, if a value is set
during an interrupt which occurs while a CAN message is being sent).

#### `can_init_{ecu}`

This replaces/wraps the `can_init` function. Currently, there is no additional
functionality, but in the future it could be used to initialize certain
ECU-specific things, or could be useful if more than one CAN bus existed on the
car.

#### `can_send_{message}`

This sends a specific CAN message. For example, to send the _BMS Core_ CAN
message, we could call `can_send_bms_core();`. This will take the aforementioned
`bms_core` variable (with all of the signals as struct fields), pack it into a
byte array, and send it as a CAN message.

#### `can_receive_{message}`

This receives a specific CAN message. In order to receive the _BMS Core_
message, we call `can_receive_bms_core();`. This function will return
immediately. The following table gives the return codes:

Return Code | Meaning
------------|--------
`0`|Data is ready
`1`|Fatal error occured
`-1`|Message not received

If a `0` is returned, we can access the data in the message struct (i.e.
`bms_core`).

### DBC Generation

The final feature of the project is DBC generation. As we saw, when we declare a
YAML file, we can also add it to the `srcs` of a `dbc_gen` target, like the one
in `vehicle/mkv/BUILD`. In general, we want to have one DBC per vehicle. In
order to build the MKV DBC, we can run:

```shell
$ bazel build //vehicle/mkv:mkv.dbc
```

Then we can access the DBC file in `bazel-bin/vehicle/mkv/mkv.dbc` and use it in
Wireshark, BusMaster, or any other software that uses a DBC.

## Future Work

In the future, it would be great if the IDs were automatically generated based
on message priority and deadline. There is a
[paper](https://www-users.cs.york.ac.uk/~robdavis/papers/RTNS2016_can_extend.pdf)
that describes an algorithm that can be used to optimally generate CAN IDs, and
this could be interesting to implement later on. But since our CANbus is so
under-utilized, there isn't really any urgency.
