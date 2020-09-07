# Run SABnzbd binary newsreader in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/sabnzbd.svg)](https://hub.docker.com/r/zcalusic/sabnzbd/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/sabnzbd.svg)](https://hub.docker.com/r/zcalusic/sabnzbd/)

Run [SABnzbd](https://sabnzbd.org/) binary newsreader in a Docker container.

## Features

- based on Debian 11 Bullseye base image
- easy user mapping via environment variables (default: uid 1000, gid 1000)
- two host mounts: configuration, downloads

## Usage

Pull image:

```
sudo docker pull zcalusic/sabnzbd
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:8080:8080 \
     -v your-config-dir:/home/sabnzbd/.sabnzbd \
     -v your-downloads-dir:/home/sabnzbd/Downloads \
     -e TZ=Europe/Zagreb \
     -e SABNZBD_UID=1000 \
     -e SABNZBD_GID=100 \
     --name sabnzbd \
     zcalusic/sabnzbd
```

## Building container image

Build image:

```
sudo make docker_build
```
