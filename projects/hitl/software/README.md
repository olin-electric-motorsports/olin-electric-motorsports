# Hardware in the Loop - Software

## Intro

This directory stores all code used to control and test with Olin Electric Motorsports' hardware-in-the-loop harness. It is organized into hitl, tests, scripts, docs, and artifacts (see below).

Note: All paths in this README file are given relative to the `software` directory.

For setup instructions and documentation, see the [project docs](awenstrup.github.io).

**Project docs:** awenstrup.github.io

## Directory Structure

### Hitl

The hitl directory contains all python classes that represent real hardware, as well as some modular software utilities. These hitl make it easy to bring up and tear down a test environment; it's as simple as creating a new object.

### Tests

All tests go here! That includes both unit tests (that test this code itself), and vehicle tests (that test our firmware on the car). All tests are written using the [pytest](https://docs.pytest.org/en/stable/) framework.

### Scripts

This is where functional scripts go, including our hardware setup script.

### Docs

This is where our documentation lives (sort of)! We use [sphinx](https://www.sphinx-doc.org/en/master/) to generate our documentation, and we use git to manage everything that sphinx needs to build our docs, without storing the docs themselves on github. We don't yet have a CI pipeline built to keep our docs up to date, but I update them pretty regularly at awenstrup.github.io 

### Artifacts

This is where all other files live. That includes our `config.ini` file, our can spec, all pin information, and logs, among other things.

## Scope

This is a work in progress! It is not at all functional yet, but the current goal is to be able to control CAN and analog inputs to all LV electronics, and test most LV functionality. This does NOT include interactions with SPI or I2C devices.

## Resources

* [project docs](awenstrup.github.io)

* [pytest docs](https://docs.pytest.org/en/stable/)

* [.dbc file help](https://www.csselectronics.com/screen/page/can-dbc-file-database-intro/language/en)

* [python-can docs](https://python-can.readthedocs.io/en/master/)

* [pyserial docs](https://pyserial.readthedocs.io/en/latest/)

* [socketcan docs](https://python-can.readthedocs.io/en/master/interfaces/socketcan.html)

* [pyenv](https://realpython.com/intro-to-pyenv/)

* [ft4222 python library](https://msrelectronics.gitlab.io/python-ft4222/)


If you go to Olin, the fastest way to get help is probably to hit up our Slack channel, `#hardware_in_the_loop`. Otherwise, you can email awenstrup@olin.edu



