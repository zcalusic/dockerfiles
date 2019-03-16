# Run rTorrent in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/rtorrent.svg)](https://hub.docker.com/r/zcalusic/rtorrent/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/rtorrent.svg)](https://hub.docker.com/r/zcalusic/rtorrent/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/rtorrent.svg)](https://microbadger.com/images/zcalusic/rtorrent/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/rtorrent.svg)](https://microbadger.com/images/zcalusic/rtorrent/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/rtorrent.svg)](https://microbadger.com/images/zcalusic/rtorrent/)
[![License](https://images.microbadger.com/badges/license/zcalusic/rtorrent.svg)](https://microbadger.com/images/zcalusic/rtorrent/)

Run [rTorrent](https://github.com/rakshasa/rtorrent) BitTorrent client + [ruTorrent](https://github.com/Novik/ruTorrent) web front-end.

## Features

- based on Debian 10 Buster base image
- rTorrent runs as a daemon, logging to container stdout
- seamless integration with ruTorrent web front-end
- usable and well commented initial configuration
- easy further configuration via drop-in configuration fragments
- easy user mapping via environment variables (default: uid 1000, gid 1000)
- geoip plugin replaced with geoipv2, fresh geoip databases fetched during container build
- two host mounts, one for configuration/state, and another one for downloads

## Usage

Pull image:

```
sudo docker pull zcalusic/rtorrent
```

Run container:

```
sudo docker run -d \
     -p 127.0.0.1:8080:80 \
     -p 50000:50000 \
     -p 50000:50000/udp \
     -v your-config-state-dir:/opt/rtorrent/share \
     -v your-downloads-dir:/data \
     -e TZ=Europe/Zagreb \
     -e RTORRENT_UID=1000 \
     -e RTORRENT_GID=100 \
     --name rtorrent \
     zcalusic/rtorrent
```

## Building container image

Build image:

```
sudo make docker_build
```
