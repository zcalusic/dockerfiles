# An experimental image with ffmpeg, mediainfo, mkvtoolnix & tmux utilities

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/ffmpeg.svg)](https://hub.docker.com/r/zcalusic/ffmpeg/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/ffmpeg.svg)](https://hub.docker.com/r/zcalusic/ffmpeg/)

An experimental image with ffmpeg, mediainfo, mkvtoolnix & tmux utilities, based on Debian 11 Bullseye base image.

## Usage

Pull image:

```
sudo docker pull zcalusic/ffmpeg
```

Run container:

```
sudo docker run -d \
     -e TZ=Europe/Zagreb \
     --name ffmpeg \
     zcalusic/ffmpeg
```

## Building container image

Build image:

```
sudo make docker_build
```
