# Run Redis in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/redis.svg)](https://hub.docker.com/r/zcalusic/redis/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/redis.svg)](https://hub.docker.com/r/zcalusic/redis/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/redis.svg)](https://microbadger.com/images/zcalusic/redis/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/redis.svg)](https://microbadger.com/images/zcalusic/redis/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/redis.svg)](https://microbadger.com/images/zcalusic/redis/)
[![License](https://images.microbadger.com/badges/license/zcalusic/redis.svg)](https://microbadger.com/images/zcalusic/redis/)

This Docker container makes it easy to get an instance of Redis up and running.  Learn more about Redis: <https://redis.io/>

## Usage

Pull image:

```
sudo docker pull zcalusic/redis
```

Run container:

```
sudo docker run -d \
     -p 6379:6379 \
     -v your-config-dir:/config \
     -v your-data-dir:/data \
     zcalusic/redis
```

You need to mount host directories that will contain Redis configuration and data files and expose Redis TCP port when starting the container.

## Building container image

Build image:

```
sudo make docker_build
```
