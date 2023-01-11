<h1 align="center">
	<img
		alt="Olin Electric Motorsports"
		src="https://nyc3.digitaloceanspaces.com/oem-outline/logo-smaller.png">
</h1>

Welcome to the Olin Electric Motorsports monorepo. This is the home for all of
the electrical, firmware, and software work our team does.

This document will help you get started contributing and walk you through
important steps for collaborating with teammates.

## Getting Started

Begin by cloning this repository into a folder of your choice (many people
choose to put it in `~/Documents`.

```shell
$ cd ~/Documents
$ git clone git@github.com:olin-electric-motorsports/olin-electric-motorsports.git
```

Once you have it, you'll need to install the KiCad Git filters:

```shell
$ ./scripts/install_kicad_git_filters.sh
```

### Installing AVR and tools

Next, install the AVR toolchain:

```shell
$ sudo apt install gcc-avr avrdude avr-libc binutils-avr gdb-avr
```

### Installing Bazel

Next, install Bazelisk. [This
link](https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64)
will download for Ubuntu on x86\_64 machines. Once downloaded, run the
following to install:

```shell
$ cp bazelisk-linux-amd64 /usr/local/bin/bazel
```
Next, run the following file to ensure that bazel is executable:
```shell
chmod u+x /usr/local/bin/bazel
```
You should now be able to run the following without error:

```shell
$ bazel build --config=16m1 //examples/blinky
```
If you get an error message stating 'env: python: No such file or directory', ensure that the PATH environment variable is properly established. This can be done by adding the file to your .bashrc file:

```
export PATH=$PATH:/usr/local/bin
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

### KiCad Setup

To install KiCad on Ubuntu, run the following:

```shell
$ sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
$ sudo apt update
$ sudo apt install --install-recommends kicad
```

Next, take note of the path to your monorepo. If you put it in your
`~/Documents` folder, your path will be `~/Downloads/olin-electric-motorsports`.

Open KiCad. From the top bar, open up _Preferences > Configure Paths..._. Add a
new row to the table:

Name | Path
-----|-----
OEM\_DIR|`/home/your-username/olin-electric-motorsports`

where `your-username` is the username on your computer.

Visit [this page](https://www.kicad.org/download/) to find instructions for
downloading KiCad for other operating systems.

## Contributing

If you are working on a new project, the first step is to make sure you have the
latest code:

```shell
$ git pull origin main
```

Next, create your feature branch:

```shell
$ git switch -c your-username/feature-name origin/main
```

Now, you can start working on code, committing on your branch, and eventually
opening up a pull request to `main`.

New projects should be placed into a folder within the `//projects` directory
(for instance, `//projects/hitl/`. Hardware and firmware that run on MKV or MKVI
should go in the proper subfolder within `//vehicle`.
