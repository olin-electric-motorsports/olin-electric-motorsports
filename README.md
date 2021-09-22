# Olin Electric Motorsports

Welcome to the OEM Monorepo! This is the home for all of the electrical,
firmware, and software work our team does.

This document will help you get started contributing and walk you through
important steps for collaborating with teammates.

## Getting Started

Begin by cloning this repository

```shell
$ git clone git@github.com:olin-electric-motorsports/olin-electric-motorsports.git
```

Once you have it, you'll need to install the KiCad Git filters:

```shell
$ ./scripts/install_kicad_git_filters.sh
```

### Installing `gcc-avr`

Next, install the AVR toolchain:

```shell
sudo apt install gcc-avr avrdude
```

### Installing Bazel

Next, install Bazelisk. [This link](https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64) will download for Ubuntu on x86\_64 machines. Once downloaded, run the
following to install:

```shell
$ cp bazelisk-linux-amd64 /usr/local/bin/bazel
```

You should now be able to run the following without error:

```shell
$ bazel build --config=16m1 //examples/blinky
```

### Install Docker

In order to use the KiCad build tools locally, you'll need to install Docker.
The instructions can be found here for [Ubuntu
20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
and [Ubuntu
18.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04).

Be sure to follow all the steps, including adding your current user to the
`docker` group. If all goes well, you should be able to run the following
command:

```shell
$ bazel build --config=docker-kicad //vehicle/mkv/hardware/lvbox/bspd:bspd_brakelight
```

## Repository Structure

```
.
├── bazel/
├── .bazelrc
├── examples/
│   └── blinky/
├── .git/
├── .gitattributes
├── .github/
│   └── workflows/
├── .gitignore
├── libs/
│   └── example_library/
├── parts/
├── projects/
│   └── example_project/
│       ├── BUILD
│       ├── libs/
│       │   └── project_specific_library/
│       │       └── BUILD
│       └── src/
├── README.md
├── scripts/
│   └── ci/
├── tutorial/
│   └── example_tutorial/
├── vehicle/
│   ├── mkv/
│   │   ├── boards/
│   │   │   └── example_board/
│   │   ├── BUILD
│   │   └── software/
│   │       └── example_code/
│   └── mkvi/
└── WORKSPACE
```
