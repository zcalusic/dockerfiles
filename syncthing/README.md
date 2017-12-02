# Run Syncthing in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/syncthing.svg)](https://hub.docker.com/r/zcalusic/syncthing/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/syncthing.svg)](https://hub.docker.com/r/zcalusic/syncthing/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/syncthing.svg)](https://microbadger.com/images/zcalusic/syncthing/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/syncthing.svg)](https://microbadger.com/images/zcalusic/syncthing/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/syncthing.svg)](https://microbadger.com/images/zcalusic/syncthing/)
[![License](https://images.microbadger.com/badges/license/zcalusic/syncthing.svg)](https://microbadger.com/images/zcalusic/syncthing/)

This Docker container makes it easy to get an instance of Syncthing up and running.  Learn more about Syncthing: <https://syncthing.net/>

## Usage

Pull image:

```
sudo docker pull zcalusic/syncthing
```

Edit docker-compose.yml to suit your environment, then run container:

```
sudo docker-compose up -d
```

## Building container image

```
sudo make docker_build
```
