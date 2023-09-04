# Real-time Data Visualization
Author: Richard Li

[Email me](mailto:rli@olin.edu) if you need any clarification (rli@olin.edu)

This folder houses the real-time data visualization project created to help us collect data off the car and visualize it in a meaningful and effective way.

## Usage:
[FULL DOCUMENTATION HERE](https://coda.io/d/Documentation_dbuFnC2EA_e/Real-time-Visualization_suRI-#_luQ3U)
1. We'll run this just to make sure that there isn't an existing instance of redis already on the device: `redis-cli shutdown`
2. Then `sudo docker-compose up` will create the necessary infrastructure for us to start transmitting data
3. Run the main pipeline: `python3 main.py`
4. This will set up a local instance of Graphana that you'll need to configure and use. Go to `localhost: 3000` (or 3001, whichever works)


## Dependencies:

- pyserial
- cantools
- redis
- redistimeseries
- redisserver
- grafana


