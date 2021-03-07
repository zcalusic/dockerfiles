# Run btcd in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/btcd.svg)](https://hub.docker.com/r/zcalusic/btcd/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/btcd.svg)](https://hub.docker.com/r/zcalusic/btcd/)

Run [btcd](https://github.com/btcsuite/btcd) an alternative full node bitcoin implementation written in Go (golang) in a Docker container.

## Features

- easy user mapping via environment variables (default: uid 1000, gid 1000)

## Usage

Pull image:

```
sudo docker pull zcalusic/btcd
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:8334:8334 \
     -p 8333:8333 \
     -v your-data-dir:/home/btcd/.btcd \
     -e TZ=Europe/Zagreb \
     -e BTCD_UID=1000 \
     -e BTCD_GID=100 \
     --name btcd \
     zcalusic/btcd
```

## Building container image

Build image:

```
sudo make docker_build
```
