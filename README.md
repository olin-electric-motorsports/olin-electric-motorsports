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

### For first-time users:
Make sure you have a GitHub account. If you don't, create one on github.com (this website). Make sure to save your username, email, and password. This will be useful in the next step.

Once you've successfully installed Ubuntu on your computer, open a terminal (press the Windows key and type `term`, then hit `Enter`).

Install `git` on your computer if it's not already.
```shell
sudo apt install git -y
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

3. Create the SSH Key \(essentially a super crazy passord\). When you’re prompted to "Enter a file in which to save the key," press Enter. This accepts the default file location. At the password prompt, hit `Enter` again.
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
```

4. To see your SSH Key, run the following command. Copy the whole contents of the output to your clipboard.
```shell
cat ~/.ssh/id_ed25519.pub
```

5. In your github page, go to your profile \(Top Right\) > `settings` > `SSH and GPG Keys`. Title your key as "Olin Computer and paste in your SSH key. Nearly done!
6. Test you ssh connection by using the command below. Type `yes` when prompted. You've done this step correctly if you see something along the lines of `Hi "username"! You've successfully authenticated, but GitHub does not provide shell access.`
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

Once you have it, you'll need to install the KiCad Git filters:

```shell
./scripts/install_kicad_git_filters.sh
```

You'll also want to have the KiCad Git Hooks to generate our symbol libraries.
```shell
./scripts/install_kicad_git_hooks.sh
```

### Installing AVR and tools

Next, install the AVR toolchain:

```shell
sudo apt install gcc-avr avrdude avr-libc binutils-avr gdb-avr
```

### Installing Bazel

Next, install Bazelisk. [This
link](https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64)
will download for Ubuntu on x86\_64 machines. Once downloaded, run the
following to install:

```shell
cd ~/Downloads
cp bazelisk-linux-amd64 /usr/local/bin/bazel
```
Next, run the following file to ensure that bazel is executable:
```shell
chmod u+x /usr/local/bin/bazel
```
You should now be able to run the following without error (after changing your directory to be in
the `olin-electric-motorsports` folder):

```shell
bazel build --config=16m1 //examples/blinky
```
If you get an error message stating 'env: python: No such file or directory', ensure that the PATH environment variable is properly established. This can be done by adding the file to your .bashrc file:

```
export PATH=$PATH:/usr/local/bin
```

### KiCad Setup

To install KiCad on Ubuntu, run the following:

```shell
sudo add-apt-repository --yes ppa:kicad/kicad-6.0-releases
sudo apt update
sudo apt install --install-recommends kicad
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
