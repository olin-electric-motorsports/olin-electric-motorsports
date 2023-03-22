FROM ubuntu:18.04
LABEL author="Richard Li"

RUN mkdir -p /root/.cache/pip/wheels && \
    cd /root/.cache/pip/wheels && \
    chmod 1777 /tmp && \
    apt-get update && \
    # Installing all recommended because we don't know what is needed for setuptools to work
    apt-get install -y\
    build-essential \
    software-properties-common \
    python3.7-dev \
    python3-dev \
    python3-pip \
    git \
    curl \
    vim && \
    ln -sf $(which python3.7) $(which python3) && \
    pip3 install setuptools wheel && \
    redis-server
    

COPY . /src
WORKDIR /src

RUN pip3 install -e .[test] --find-links=/root/.cache/pip/wheels && \
    python3 setup.py develop --no-deps && \
    rm -r /root/.cache

CMD ["/src/scripts/entrypoint.sh"]