# Run Dynomite in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/dynomite.svg)](https://hub.docker.com/r/zcalusic/dynomite/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/dynomite.svg)](https://hub.docker.com/r/zcalusic/dynomite/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/dynomite.svg)](https://microbadger.com/images/zcalusic/dynomite/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/dynomite.svg)](https://microbadger.com/images/zcalusic/dynomite/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/dynomite.svg)](https://microbadger.com/images/zcalusic/dynomite/)
[![License](https://images.microbadger.com/badges/license/zcalusic/dynomite.svg)](https://microbadger.com/images/zcalusic/dynomite/)

This Docker container makes it easy to get an instance of Dynomite up and running.  Learn more about Dynomite: <https://github.com/Netflix/dynomite>

## Usage

Pull image:

```
sudo docker pull zcalusic/dynomite
```

Run container:

```
sudo docker run -d -p 8101:8101 -p 8102:8102 -p 22222:22222 zcalusic/dynomite
```

You need to expose Dynomite TCP ports when starting the container.  Dynomite will run with ```daemon``` user privileges

To provide custom ```dynomite.yml``` configuration file, add ```-v /your/dynomite.yml:/conf/dynomite.yml``` argument to the docker run command.

## Building container image

Build image:

```
sudo make docker_build
```
