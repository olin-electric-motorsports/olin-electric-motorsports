IOController
============

API
---
.. automodule:: hitl.iocontroller
   :members:

Writing pin config files
------------------------
Pin config files dictate which pins are connected to what hardware, and what names to use for each pin. 

Most of the code in this repository relies on standards, like CAN, pytest, and .dbc files. There is one big exception to this: the interface between a laptop and the HitL hardware. We use a USB-A to USB-B connector to connect (simple enough), but the message format, and format of the file that documents HitL I/O, is proprietary. In building this file and message format, we prioritized for simplicity and usability over efficiency; the traffic through the USB cable is relatively low.

You'll see that ``artifacts/pin_info.csv`` has 9 columns. The ``IOController`` python object parses this file, and expects to see ALL 9 COLUMNS IN THE CORRECT ORDER. It's okay if a some column values are blank (like ``address`` or ``notes``), but make sure there are 8 commas in every line (separating the 9 values). The most important values are explained below.

* **Board:** The board number (0-63) specifies which expansion board the signal is sent/received to/from. This should be the same as the I2C address of the expansion board.

* **Pin Number:** The pin number (1-255) specifies which pin on the expansion board to use. Each expansion board's firmware will contain a mapping from these integers to individual pins. To check what this is, check `../firmware`

* **Name:** This is the name of the pin. You will use this name later any time you want to get or set a signal on that pin. We usually name pins with ``SCREAMING_SNAKE_CASE``

* **Type:** The supported signals (right now) are analog and digital. Analog signals represent voltages; some of our expansion boards have DACs (digital to analog converters) to output these voltages and ADCs (analog to digital converters) to read them in. Digital signals are "slow", in that you can set a pin to be high or low, but we don't currently support digital communication protocols like SPI, I2C, or PWM.

* **Min/Max:** These two values represent the minimum and maximum values for each pin. For digital signals, we conventionally use 0 and 1 (rather than 0 and the nominal voltage of the system), but it doesn't really matter. For analog values, min and max are much more important. _Make sure these represent the low and high rails of the DAC or ADC connected to the pin._

Setting signals simultaneously
------------------------------
Under normal use, the ``IOController`` sets signals sequentially, with a small delay between each signal.
If that is an issue, the ``IOController`` provides an elegant way around this. The ``IOController`` uses a context
manager to send a special signal to the hardware to indicate signals should be set simultaneously.

By using a context manager to do this, the code stays elegant. Remember, setting signals normally might look like this::

   io.set_state("THROTTLE_POT_1", 2.5)
   io.set_state("THROTTLE_POT_2", 2.5)

To set the signals at the same time, you can instead use::

   with io:
      io.set_state("THROTTLE_POT_1", 2.5)
      io.set_state("THROTTLE_POT_2", 2.5)

If you're curious what this is doing in the backend, the ``IOController`` sends a 0xFF byte before the message. The hardware
sees this and knows to wait, reading set requests until another 0xFF byte is received (as the first byte of a message). Only
once that second 0xFF byte is sent does the hardware set any signals.