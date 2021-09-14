.. hardware_in_the_loop documentation master file, created by
   sphinx-quickstart on Wed Dec  2 15:30:53 2020.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the OlinHITL documentation!
================================================

.. toctree::
   :maxdepth: 1
   :caption: Contents:

   setup
   config
   usage/shell
   usage/tests
   hitl/roadkillharness
   hitl/cancontroller
   hitl/iocontroller
   hitl/ecu
   hitl/utils

Introduction
============

Welcome to the OlinHITL homepage! This project was built to enable Olin's Formula SAE team to perform hardware-in-the-loop testing on their car. It isn't quite a python library, and isn't quite a full-fledged application; it lives somewhere in between. If you plan on using this project to write tests, we recommend developing tests inside this projects' ``tests`` directory, but you by no means have to. As long as you follow the setup instructions on the setup page, you should be good to develop tests wherever.

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
