# Run Decred full node in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/dcrd.svg)](https://hub.docker.com/r/zcalusic/dcrd/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/dcrd.svg)](https://hub.docker.com/r/zcalusic/dcrd/)

Run [Decred full node](https://github.com/decred/dcrd) in a Docker container.

## Features

- based on Debian 11 Bullseye base image
- easy user mapping via environment variables (default: uid 1000, gid 1000)

## Usage

Pull image:

```
sudo docker pull zcalusic/dcrd
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:9109:9109 \
     -p 9108:9108 \
     -v your-data-dir:/home/dcrd \
     -e TZ=Europe/Zagreb \
     -e DCRD_UID=1000 \
     -e DCRD_GID=100 \
     --name dcrd \
     zcalusic/dcrd
```

## Building container image

Build image:

```
sudo make docker_build
```
