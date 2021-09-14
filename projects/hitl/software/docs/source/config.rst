Configuration
=============

After the repository is installed and setup, a ``config.ini`` file should exist with a default configuration. That said, you may want/need to configure this to your own preferences/needs. The ``config.ini`` file has 3 sections, detailed below.

LOGGING
^^^^^^^
The logging sections outlines basic logging options. **NOTE:** ``pytest`` ignores these options in favor it its own ``pytest.ini`` file, so you may have to update those settings as well if you want to alter how ``pytest`` handles logging. You can also read `pytest's logging configuration documentation <https://docs.pytest.org/en/stable/logging.html>`_ for more information.

You can also check out the ``logging`` documentation `here <https://docs.python.org/3/library/logging.html>`_ ; it goes over much of the information below in more detail

log_level:
    This option specifies how verbose you want logging to be. The options are (in order) ``CRITICAL``, ``ERROR``, ``WARNING``, ``INFO`` and ``DEBUG``. All logs of the specified order or higher (with ``CRITICAL`` being most important) will be logged.

log_format:
    This specifies the format of each logged message. Read the logging docs for more information.

log_path:
    Where to log to. If you only want to log to the console, use ``None``. This option also supports some variables. Specifically, if you use ``$LOGS``, it will be replaced with the absolute path to ``artifacts/logs``. If you use ``$DATETIME``, it will be replaced with the current datetime. If I'm logging to a file, I usually specify this option as ``$LOGS/$DATETIME.log``

HARDWARE
^^^^^^^^
This section includes some hardware-specific options.

can_bitrate:
    The bitrate of the CAN bus.

can_channel:
    The name of the CAN channel, on your computer. You can see available CAN channels on your linux computer with ``$ ip link show | grep can``. This parameter is required by socketcan; venture into the `socketcan docs <https://www.kernel.org/doc/Documentation/networking/can.txt>`_ if you dare. Otherwise, if you have a PCAN dongle plugged in, ``can0`` should work; if you don't, you can use ``vcan0`` to create a fake CAN bus.

PATHS
^^^^^
This section should be pretty self explanatory; these are the paths the project uses to look for files and devices. These paths should be consumed by the top-level testing object (for example, a ``RoadkillHarness``), and passed from there to the objects that need them (for example, an ``IOController``).

pin_config:
    The path the pin config file (relative to the ``artifacts`` directory). This file is documented in more detail on the ``IOController`` page. For example, if your pin config file is at ``artifacts/pin_info.csv``, use ``pin_info.csv`` (NOT ``olin-electric-motorsporstsoftware/artifacts/pin_info.csv``)

dbc_path
    The path your ``.dbc`` file. Like ``pin_config``, this is relative to the ``artifacts`` directory.

can_log_path
    **This option is not supported yet**
