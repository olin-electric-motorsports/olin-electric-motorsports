[Email me](mailto:rli@olin.edu) if you need any clarification (rli@olin.edu)

Current: telemetry system up and running with sample radio messages!

## Dependencies:

- pyserial
- cantools
- redis
- redistimeseries
- redisserver
- grafana

## How to use:
[FULL DOCUMENTATION HERE](https://docs.olinelectricmotorsports.com/doc/real-time-visualization-P59eM2Ypk0)
1. sudo docker-compose up
2. python3 decoder.py
3. python3 app.py
4. go to localhost: 3000 (or 3001, whichever works)


## todo
- add in config file / udev for hardcoded values
- add in timeit python for code benchmarking 
- add in pytest to run automatic code tests
- docker integration 
- setup RDB and grafana config files


## [Work in Progress] installation instructions
pip install pyserial 

check serial ports, check code, TODO: include args 

need a config file for redis? 
- loadmodule? 