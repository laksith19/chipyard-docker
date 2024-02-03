## Arm Hosts

Chipyard doesn't natively support arm64, so you'll have to run the container under emulation. I've tested this on a raspberry pi 4 and although it works, it was painfully slow. I'd really appreciate it if someone with an M1/M2 Mac tries this setup and can get back to me on the [discussions](https://github.com/laksith19/chipyard-docker/discussions) or the [issues](https://github.com/laksith19/chipyard-docker/issues) page.

### MacOS

Before installing Docker Desktop ensure that you have Rosetta 2 installed, in a terminal window run:

```bash
$ softwareupdate --install-rosetta
```

Follow instructions provided [here](https://docs.docker.com/desktop/settings/mac/) and enable **Use Virtualization Framework** and **Use Rosetta for x86/AMD64 emulation on Apple Silicon**.  

### Linux

If you're on a raspberry pi or a similar low power computer, be warned that it's painfully slow.

After you've got docker installed on your machine, you can install an x86-64/amd64 emulator for it by using another [docker image](https://github.com/tonistiigi/binfmt):
```bash
$ docker run --privileged --rm tonistiigi/binfmt --install amd64
```

### Windows

Why? Yea that's it, I've got nothing for you. Sorry. 

### Test your setup (common)

In a terminal window try running a smaller image to check if your setup can run emulated amd64 containers:
```bash
$ docker run --rm --platform=linux/amd64 amd64/alpine uname -a
```

You should see get an output without errors that looks something like this:
```bash 
Linux 382db92acfdc 6.1.0-rpi8-rpi-v8 #1 SMP PREEMPT Debian 1:6.1.73-1+rpt1 (2024-01-25) x86_64 Linux
```
This important part to note here is the last bit that states that the container is x86_64 Linux. 
If you get errors try rebooting and running through the above setps for your platform again. Feel free to open an issue / discussion in case things still don't work out. 

If everything looks good, congrats! You can go back to the [readme](./Readme.md) and follow the general usage instructions. Just don't try building the image locally, you're much better off pulling the pre-built image. 
