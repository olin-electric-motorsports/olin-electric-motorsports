# Real-time Data Visualization
Author: Venkadesh Eswaranandam, Richard Li

[Email Richard](mailto:rli@olin.edu) or [Venkadesh](mailto:veswaranandam@olin.edu) if you need any clarification.

This folder houses the remote software portion of the real-time data visualization project created to help us collect data off the car and visualize it in a meaningful and effective way.

## Current status:

- [ ] Battery temperature and voltage
- [ ] IMU
- - [ ] Acceleration
- - [ ] Heading
- - [ ] Rotational movement
- [ ] GPS data (location data)
- [ ] Wheel rotation speed
- [ ] Brake + throttle sensor (how pressed is the pedal)
- [ ] Requested torque for each motor
- [ ] Suspension strain (on each wheel maybe?)
- [ ] Listening for particular errors
- [ ] Transmitting an error code over


## Basic Usage:
1. We'll run this just to make sure that there isn't an existing instance of redis already on the device: `redis-cli shutdown`
2. Then `sudo docker-compose up` will create the necessary infrastructure for us to start transmitting data
3. Run the main pipeline: `python3 main.py`
4. This will set up a local instance of Graphana that you'll need to configure and use. Go to `localhost: 3000` (or 3001, whichever works)


## Dependencies:

- pyserial
- cantools
- redis
- redistimeseries
- redisserver -> Immediaty uninstall after (for redis-cli only) 
- grafana
* redis
* docker
* docker-compose
* python3-pip

## Quick Start (Grafana):
Run the following commands (in the `datavisualization` directory):
```
sudo python3 setup.py install

sudo touch /var/log/telemetry-pipeline.log
sudo touch /var/log/verbose-telemetry-pipeline.log
```
Run `sudo docker-compose up` to install docker for the first time

## Running

After setup above you can directly run `sudo docker-compose up`

Wait until you get output similar to the following
``` log
grafana_host | logger=context traceID=00000000000000000000000000000000 userId=0 orgId=1 uname= t=2022-10-12T01:17:09.27146491Z level=info msg="Request Completed" method=GET path=/api/datasources/1/health status=400 remote_addr=172.18.0.1 time_ms=1 duration=1.506474ms size=102 referer=http://localhost:3001/datasources/edit/1C3T-II4k traceID=00000000000000000000000000000000 handler=/api/datasources/:id/health
```
(pay attention to the value of remote_addr)

Go to `localhost: 3000` (or 3001, whichever works) in your browser. You should see a Grafana dashboard.

After logging onto Graphana do the following
1. Create a new data source
2. Choose Redis
3. Change only the following:
    * Type -> standalone
    * Address -> 172.18.0.1:6379 (or remote_addr:6379 if graphana output is different)exi
4. Save and test
5. Go to dashboards on sidebar
    - add new dashboard,
    - add new panel
## Adding the main dashboard

Navigate to localhost:3001

Go to dashboards -> new folder -> create OEM folder

### Create a new data source (hover over cog):

Choose Redis

Change only the following:

* Type -> standalone
* Address -> 172.18.0.1:6379 

dashboards -> import -> fill in OEM, Redis

# To set up radio (for testing)
`sudo apt install can-utils` (if you haven't already)

on computer one:

```
sudo slcand -o -s0 -t hw -S 9600 /dev/ttyUSB0
sudo ip link set up slcan0
```

on computer two:

```
sudo slcand -o -s0 -t hw -S 9600 /dev/ttyUSB0
sudo ip link set up slcan0
```

Test computer one:

`cansniffer slcan0`

Test computer two:

`cansend slcan0 123#00FFAA5501020304`

You should see some data appear on computer one after the command, then disappear shortly.

# Radio support (debugging and firmware flash, if chosen) - Advanced
```
sudo apt install minicom
minicom --device=/dev/ttyUSB??? --baudrate=9600
```

Supports [AT commands](https://ardupilot.org/copter/docs/common-3dr-radio-advanced-configuration-and-technical-information.html#using-the-at-command-set)

Enter `+++` when opened in minicom, 

use `AT0` to exit AT mode. 

Use Ctrl+a + x to exit minicom