# Run qBittorrent BitTorrent client in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/qbittorrent.svg)](https://hub.docker.com/r/zcalusic/qbittorrent/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/qbittorrent.svg)](https://hub.docker.com/r/zcalusic/qbittorrent/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/qbittorrent.svg)](https://microbadger.com/images/zcalusic/qbittorrent/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/qbittorrent.svg)](https://microbadger.com/images/zcalusic/qbittorrent/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/qbittorrent.svg)](https://microbadger.com/images/zcalusic/qbittorrent/)
[![License](https://images.microbadger.com/badges/license/zcalusic/qbittorrent.svg)](https://microbadger.com/images/zcalusic/qbittorrent/)

Run [qBittorrent](https://www.qbittorrent.com/) BitTorrent client in a Docker container.

## Features

- based on Debian 10 Buster base image
- controlled via Web User Interface
- easy user mapping via environment variables (default: uid 1000, gid 1000)
- three host mounts: configuration, state, downloads

## Usage

Pull image:

```
sudo docker pull zcalusic/qbittorrent
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:8080:8080 \
     -p 8999:8999 \
     -p 8999:8999/udp \
     -v your-config-dir:/home/qbittorrent/.config/qBittorrent \
     -v your-state-dir:/home/qbittorrent/.local/share/data/qBittorrent \
     -v your-downloads-dir:/data \
     -e TZ=Europe/Zagreb \
     -e QBITTORRENT_UID=1000 \
     -e QBITTORRENT_GID=100 \
     --name qbittorrent \
     zcalusic/qbittorrent
```

## Building container image

Build image:

```
sudo make docker_build
```
