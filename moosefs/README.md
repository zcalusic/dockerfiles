# Run MooseFS distributed file system in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/moosefs.svg)](https://hub.docker.com/r/zcalusic/moosefs/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/moosefs.svg)](https://hub.docker.com/r/zcalusic/moosefs/)

Run [MooseFS](https://moosefs.com/) distributed file system in a Docker container.

## Usage

Pull image:

```
sudo docker pull zcalusic/moosefs
```

Run container:

```
sudo docker run -d \
     -p 94xx:94xx \
     -v your-moosefs-config:/etc/mfs \
     -v your-moosefs-data:/var/lib/mfs \
     -e MOOSEFS_START=master \
     -e TZ=Europe/Zagreb \
     --name moosefs \
     zcalusic/moosefs
```

## Building container image

Build image:

```
sudo make docker_build
```

## Instructions

`MOOSEFS_START` should be one of: master, metalogger, chunkserver, client or gui.
