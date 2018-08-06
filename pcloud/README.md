# Run pCloud storage client in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/pcloud.svg)](https://hub.docker.com/r/zcalusic/pcloud/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/pcloud.svg)](https://hub.docker.com/r/zcalusic/pcloud/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/pcloud.svg)](https://microbadger.com/images/zcalusic/pcloud/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/pcloud.svg)](https://microbadger.com/images/zcalusic/pcloud/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/pcloud.svg)](https://microbadger.com/images/zcalusic/pcloud/)
[![License](https://images.microbadger.com/badges/license/zcalusic/pcloud.svg)](https://microbadger.com/images/zcalusic/pcloud/)

This Docker container makes it easy to mount your pCloud storage.  Learn more about pCloud: <https://www.pcloud.com/>

## Usage

Pull image:

```
sudo docker pull zcalusic/pcloud
```

Run container:

```
sudo docker run -d \
     -v your-data-dir:/root/.pcloud \
     --name pcloud \
     zcalusic/pcloud
```

You need to mount host directory that will persist pCloud configuration & cache files.

## Building container image

Build image:

```
sudo make docker_build
```
