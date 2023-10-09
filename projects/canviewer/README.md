# OEM CAN Dashboard

Welcome! Here lies the documentation for the use of the CAN dashboard GUI on our team.

The dashboard uses a QT GUI and includes support for SocketCan (for example, the PCAN dongles) as well as our new Seeedstudio dongles.

It also is fully configurable via YAML.

## Using the tool
1. Set up your CAN device if you are using a PCAN or other socketcan device. Instruction for this can be found [here](https://coda.io/d/_dbuFnC2EA_e/How-to-use-CAN_suzvC)
    - You can also use this tool with a virtual CAN bus
2. Run the tool! This is done using the command `bazel run //projects/canviewer`. There are three command line arguments as well
    - `-b` - Either `seeedstudio` or `socketcan` 
    - `-c` - Channel
        - Socketcan: this is the network interface name you created when setting up your device (usually can0 for real hardware or vcan0 for a virtual CAN bus)
        - Seeedstudio: this is the _device path_ for your CAN dongle. Typically this will be something like `/dev/ttyUSB0`. The best way to find it is to run `ls /dev/ttyUSB*`, which lists all the USB device paths, before and after you plug in your dongle to find the one that was added. The number starts at 0 and increments every time something is plugged in, so if you unplug and replug your CAN dongle, the number will change!
    - `-d` - the DBC file to be used to decode the CAN messages. This is specified as a file path starting from the root of the monorepo.
        - This has a default value of `vehicle/mkvi/mkvi.dbc` - in other words, if you want to decode messages from MKVI or a MKVI board, you do not need to specify this argument. If you're reading this in future years, feel free to update the default value in a new PR - just be sure to add your DBC as a dependency in the BUILD file for this project.
        - You can check `//vehicle/mkvi/BUILD` to see which DBC/YAML files are included in the master DBC
    - These arguments would be passed like so for a bustype of seeedstudio and a USB device at /dev/tty/USB0 when plugged into MKVI:
        ```
        bazel run //projects/canviewer -- -b seeedstudio -c /dev/tty/USB0
        ```
        The two dashes signal the end of the arguments to bazel and any remaining ones will be passed to the CAN viewer.
    
## Configuring the tool

To change the signals that are displayed in the first two columns, simply add or remove the signal names from underneath their respective column headers in the YAML. For example, if I wanted to see the IMD status in the Vehicle Values section, I would add this line under the vehicle values header
```
imd_status:
```
Note the colon at the end - it is required.

The states section is formatted like so:
```
air_control_critical: # Message name
  air_state: # State signal
  air_fault: # Fault Signal
```
Again, note the indentation and the colon - they are part of the YAML format.

If you would like to apply a processing function to process the value one of the signals in the vehicle values column before displaying it:
1. Define the function in the `projects/canviewer/utils.py` file
2. Specify it in the YAML by setting the signal's value to a dictionary with `processing_function` as a key and the function name as its value, like so:
```
# Vehicle Values
max_temperature:
  processing_function: convertVtoT
min_temperature:
  processing_function: convertVtoT
pack_voltage:
air_p_status:
...
```
  
