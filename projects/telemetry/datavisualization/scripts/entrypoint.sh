#!/bin/bash

# run the main telemetry code in `app.py`, pipe the output into the logfile and print 
# the final values of the log file to the terminal with `tail`
/usr/bin/python3 telemetry/app.py &> /var/log/telemetry-pipeline.log &
tail -Fq /var/log/telemetry-pipeline.log /var/log/verbose-telemetry-pipeline.log
