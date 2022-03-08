# Run Chia blockchain Python implementation in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/chia.svg)](https://hub.docker.com/r/zcalusic/chia/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/chia.svg)](https://hub.docker.com/r/zcalusic/chia/)

Run [Chia blockchain](https://www.chia.net/) Python implementation in a Docker container.

## Features

Very simple image, trying to overcome some shortcomings of the official one...

- based on Debian 11 Bullseye base image, with Python 3.9
- only necessary software packages included, to get much smaller final image
- services run by an unpriviledged user to improve security
- easy user mapping via environment variables (default: uid 1000, gid 1000)
- easy selection of services to run (node, wallet, farmer, harvester...)
- remote harvesters don't change ID on each restart, easier for pools to track statistics
- no need to add private keys on each restart (remembered in the Python keyring, which is persisted on the volume)
- zombie (defunct) processes properly reaped by dumb-init as PID 1 in container

## Usage

Pull image:

```
sudo docker pull zcalusic/chia
```

Run container:

```
sudo docker run -d \
     -p 8444:8444 \
     -v your-chia-dir:/home/chia \
     -e CHIA_UID=1000 \
     -e CHIA_GID=100 \
     -e CHIA_START=farmer \
     -e TZ=Europe/Zagreb \
     --name chia \
     zcalusic/chia
```

## Building container image

Build image:

```
sudo make docker_build
```

## Instructions

I suggest that you don't provide `CHIA_START` environment variable on the first run of a specific instance. Then container will start, but without any real service running, and let you access it like this: `docker exec -it -u $CHIA_UID chia bash`, to properly initialize it first. Some useful commands:

```
chia init
sed -i 's/localhost/127.0.0.1/g' ~/.chia/mainnet/config/config.yaml
chia configure --upnp false
chia configure --log-level INFO
chia keys generate (or add)
...
```

Then respawn the container with `CHIA_START="farmer"` to run all services, just like the official image does by default.

Use `CHIA_START="node wallet farmer-only"` to run all services except the harvester. Consult `chia start --help` to find all possible combinations.

To spawn a remote harvester first follow instructions given by `chia init --help`, then further initialize with something like this:

```
sed -i 's/localhost/127.0.0.1/g' ~/.chia/mainnet/config/config.yaml
chia configure --upnp false
chia configure --log-level INFO
chia configure --set-farmer-peer $farmer_address:$farmer_port
chia plots add -d /plots
...
```

Then respawn the container with `CHIA_START="harvester"`. If everything is OK, you can then delete ssl/ca folder copied over from farming machine, it won't be needed again. Also, you don't need to add or generate any keys on harvester-only nodes.

Use `TZ` environment variable to set proper timezone for services.

Things to check in case of trouble:
- that host folders you're mounting into the container have adequate ownerships/modes
- that all required ports on farmer node are exposed on host (8444 for full node p2p communication, also 8447 if you're connecting remote harvesters...)

## Contributors

If you find anything missing or not working, please open an issue. Pull requests also welcome.

But, please, let's keep it clean and simple. You can always fork and add sophisticated functionality if needed.
