# Run Bitcoin Core in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/bitcoin.svg)](https://hub.docker.com/r/zcalusic/bitcoin/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/bitcoin.svg)](https://hub.docker.com/r/zcalusic/bitcoin/)

Run [Bitcoin Core](https://bitcoincore.org/) in a Docker container.

## Features

- based on Debian 11 Bullseye base image
- easy user mapping via environment variables (default: uid 1000, gid 1000)

## Usage

Pull image:

```
sudo docker pull zcalusic/bitcoin
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:8332:8332 \
     -p 8333:8333 \
     -v your-data-dir:/home/bitcoin/.bitcoin \
     -e TZ=Europe/Zagreb \
     -e BITCOIN_UID=1000 \
     -e BITCOIN_GID=100 \
     --name bitcoin \
     zcalusic/bitcoin
```

## Building container image

Build image:

```
sudo make docker_build
```
