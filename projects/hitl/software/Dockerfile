FROM ubuntu:latest

RUN apt update
RUN apt install iproute2 python3.9 sudo -y
RUN apt install python3-pip -y

RUN ln /usr/bin/python3.9 /usr/bin/python
COPY . /src/
RUN cd src && python -m pip install -e .

ENTRYPOINT bash