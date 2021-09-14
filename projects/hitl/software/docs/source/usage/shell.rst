The Shell
=========

We haven't built out a command line interface for interacting with our HITL system yet, but we think that the python shell works great! Just run the following commands::

   $ python
   >>> from hitl.roadkillharness import RoadkillHarness
   >>> harness = RoadkillHarness()

And thats it! You've created a RoadkillHarness object that you can use to control the HITL system. Here are some things you can try:

* `Getting a CAN state from the car`

    ``>>> harness.throttle.get_state("mcTorqueRequest")``

* `Setting a voltage on the car`

    ``>>> harness.throttle.set_state("THROTTLE_POT_1", "2.5")``

If you want to get to know the system more, keep reading, reach out to anyone on the HITL subteam for help, or check out the resources section below.