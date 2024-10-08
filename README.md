<h1 align="center">
	<img
		alt="Olin Electric Motorsports"
		src="https://nyc3.digitaloceanspaces.com/oem-outline/logo-smaller.png">
</h1>

Welcome to the Olin Electric Motorsports monorepo. This is the home for all of our
electrical, firmware, and software work.

This document will help you get started contributing and walk you through
important steps for collaborating with teammates.

## Getting Started

### For new members:
Make sure you have a GitHub account. If you don't, create one on [GitHub](github.com) (this website). Make sure to save your username, email, and password. This will be useful in the next step. Once you have an account, STOP, and ask a lead/senior engineer to add you to the `olin-electric-motorsports` org.

Once you've successfully installed Ubuntu, have a GitHub account, and have ben added as an org member: on your computer, open a terminal (press the Windows key and type `term`, then hit `Enter`).

Install `git` on your computer if it's not already.
```shell
sudo apt install git -y
```

Also install python3
```shell
sudo apt update && sudo apt install python3
```

### Linking a Computer to your Account
We need to connect your GitHub account to your computer's specific git instance \(created by the command you just ran\). We do this for safety: someone pretending to be you can't add code to our repo!
1. Set your username:
```shell
git config --global user.name 'your username here'
```

2. Set your email address:
```shell
git config --global user.email 'your email here'
```

3. Create the SSH Key \(essentially a super crazy passord\). When you’re prompted to "Enter a file in which to save the key," press `Enter`. This accepts the default file location. At the password prompt, hit `Enter` again.
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

4. To see your SSH Key, run the following command. Copy the whole contents of the output to your clipboard (you won't be able to copy or paste in the terminal using ctrl+c and ctrl+v, instead use ctrl+shift+c and ctrl+shift+v or right-click to do it graphically).
```shell
cat ~/.ssh/id_ed25519.pub
```

5. In your github page, go to your profile \(Top Right\) > `settings` > `SSH and GPG Keys`. Click on the green `New SSH Key` button. Title your key as `Olin Computer` and paste in your SSH key. Finally, click the green `Add SSH Key` button. Nearly done!
6. Test your ssh connection by using the command below. Type `yes` when prompted. You've done this step correctly if you see something along the lines of `Hi "username"! You've successfully authenticated, but GitHub does not provide shell access.`
```shell
ssh -T git@github.com
```
### Creating your OEM environment
Clone this repository into a folder of your choice (many people
choose to put it in `~/Documents`.

```shell
cd ~/Documents
git clone git@github.com:olin-electric-motorsports/olin-electric-motorsports.git
```

Once you have it, cd into the repo and install the KiCad Git filters (a set of rules that remove temp files that can cause clutter):

```shell
cd olin-electric-motorsports/
./scripts/install_kicad_git_filters.sh
```

You'll also want to have the KiCad Git Hooks to generate our symbol libraries. These hooks run every time you push or pull and allow multiple users to add symbols/footprints to our KiCAD library.

```shell
./scripts/install_kicad_git_hooks.sh
```

### Installing AVR and tools
Next, install the AVR toolchain:

```shell
sudo apt install gcc-avr avrdude avr-libc binutils-avr gdb-avr
```

### Installing Cantools
You need to be able to hear to our MCUs on the car!
```shell
pip3 install cantools
sudo apt install can-utils
```

### Installing Bazel

Next, install Bazelisk. Run this massive blob and you should be good to go.

```shell
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
sudo mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt install bazel-5.4.0
```

You should now be able to run the following without error (after changing your directory to be in
the `olin-electric-motorsports` folder):

```shell
bazel build --config=16m1 //examples/16M1/blinky -c opt
```
If you get an error message stating 'env: python: No such file or directory', ensure that the PATH environment variable is properly established. This can be done by adding the file to your .bashrc file:

```
export PATH=$PATH:/usr/local/bin
```

### KiCad Setup

To install KiCad on Ubuntu, run the following: Type `Y` when prompted.

```shell
sudo add-apt-repository --yes ppa:kicad/kicad-8.0-releases
sudo apt update
sudo apt install --install-recommends kicad
```


Open KiCad (windows key and type KiCAD) Click on the Blue App (always do this when opening Kicad - otherwise you can corrupt files!). Hit `Enter` if asked about settings imports and auto-updates for add-ons.
From the top bar, open up _Preferences > Configure Paths..._. Add a new row to the table using the plus button:

Name | Path
-----|-----
OEM\_DIR|`/home/your-username/Documents/olin-electric-motorsports`

where `your-username` is the username on your computer.
If you cloned our repository into a different directory than the `~/Documents` folder, this is just an absolute path to the repo.

Visit [this page](https://www.kicad.org/download/) to find instructions for
downloading KiCad for other operating systems.

## Integration Resources
### Flashing to microcontrollers
To flash (program) an ATMEGA16m1 microcontroller, use a variation of the following command:
```shell
need to insert example flashing command here
```

To flash (program) an ATMEGA16m1 microcontroller using the btldr (remote CAN flashing), use a variation of the following command:
```shell
need to insert example can flashing command here
```

### Viewing CAN data/the canviewer
First, plug a CAN-to-USB dongle into your computer and connect CAN+ and CAN- to the car or test platform's CAN port.

To initalize the dongle, run the following command:
```shell
need to insert example can init command here
```

### Cantools
1. `candump`: A tool for streaming CAN frames as they are sent. Useful for short captures or slow data.
2. `cansniffer`: Similar to candump, but messages with the same ID replace each other for easier viewing (a table).
3. `cansend`: Use this tool to send CAN frames from your computer. CAN (oh the puns will never end) be helpful when debugging boards or to program modules like the motor controller or G-Meter.

### CANViewer
OEM has designed a custom Python CAN GUI to monitor the car's state.
Type the following command to run the viewer.
```shell
need to insert CANViewer command here.
```


### Contributing

If you are working on a new project, the first step is to make sure you have the
latest code:

```shell
git pull origin main
```

### Onboarding stop here...

Next, create your feature branch (only do this once you have a project!):

```shell
git switch -c your-username/feature-name origin/main
```

Now, you can start working on code, committing on your branch, and eventually
opening up a pull request to `main`.

New projects should be placed into a folder within the `//projects` directory
(for instance, `//projects/hitl/`. Hardware and firmware that run on MKV or MKVI
should go in the proper subfolder within `//vehicle`.
