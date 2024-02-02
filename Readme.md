## Chipyard Docker Images

**These are unoffical docker builds not affiliated with the Chipyard project.**

 Please limit any issues you run into while using these images to this repository.

## Current Status

As of right now this is a custom image specifically tailored to fit the needs of the Spring 2024 offering of CS152. I might decide to support a more general build in the future. 

## Pre-Requisites
- Ensure that you have [Docker](https://docs.docker.com/get-docker/) installed on your machine.
- Chipyard is massive, so make sure that you have at least 25GB of free space available on you system. 
- Be connected to a decently stable internet connection, docker will need to pull a pretty large image (8GB) and it will take a really long time otherwise. 
    - You can take a look at the [instructions](#Building-Locally) to build locally if you'd rather start with a smaller download and let docker build out the image locally on your computer. 
- If you're using an Arm based computer (Apple Silicon Macs / Raspberry pi etc...) please follow the [instructions](./arm-hosts.md) for Arm hosts before proceeding.

## Usage
Clone this repo to your computer and navigate to it's root. You'll need to run these commands from inside the git repo for them to work correctly. 

### Start the container
``` bash
$ docker compose up -d
```

Docker will pull a compressed image from it's repositories the very first time you run this command so it might take a while depending on your internet connection. This should be a one time thing and subsequent runs should be really quick. 

### Connect to it's shell
```bash
$ docker compose exec chipyard bash
```

You will be dropped in a bash shell in `/opt/chipyard` which is the `$CHIPYARDROOT` for this container. Only files created under this directory will be preserved.

`env.sh` should already be sourced and all the environment variables should be setup correctly in this shell and you don't have to worry about that. 

You can also use the VSCode Containers extension to connect to the container while it's running.

### Stop the container
```bash
$ docker compose down
```

**Remember: Only files under `/opt/chipyard` will be saved, everything else will be lost.**


## Building Locally

If you'd rather build the image locally, please keep in mind that it'll will take a decent amount of time to complete (took my computer 25mins) but it's only a one time thing. Also I've only tested the build on a Linux machine, so if you're using docker in Windows or on a Mac you might run into some additional issues.  

All you need to do is replace the `docker-compose.yml` file with the alternate one provided `docker-compose-local.yml.` The easiest way to do this would be by running:
```bash 
$ mv docker-compose-local.yml docker-compose.yml
```

You can follow the general [usage](#Usage) instructions after this, docker will build the image locally the very first time you start the container. 

