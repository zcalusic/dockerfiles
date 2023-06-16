# Run SABnzbd binary newsreader in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/sabnzbd.svg)](https://hub.docker.com/r/zcalusic/sabnzbd/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/sabnzbd.svg)](https://hub.docker.com/r/zcalusic/sabnzbd/)

Run [SABnzbd](https://sabnzbd.org/) binary newsreader in a Docker container.

## Features

- based on Debian 12 Bookworm base image
- easy user mapping via environment variables (default: uid 1000, gid 1000)
- configurable Web UI host & port
- three host mounts: configuration, complete & incomplete downloads

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
     -v your-complete-downloads-dir:/home/sabnzbd/Downloads/complete \
     -v your-incomplete-downloads-dir:/home/sabnzbd/Downloads/incomplete \
     -e TZ=Europe/Zagreb \
     -e SABNZBD_UID=1000 \
     -e SABNZBD_GID=100 \
     -e SABNZBD_SERVER=0.0.0.0:8080 \
     --name sabnzbd \
     zcalusic/sabnzbd
```

## Building container image

Build image:

```
sudo make docker_build
```
