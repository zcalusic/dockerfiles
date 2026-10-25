# Run Dynomite in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/dynomite.svg)](https://hub.docker.com/r/zcalusic/dynomite/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/dynomite.svg)](https://hub.docker.com/r/zcalusic/dynomite/)

This Docker container makes it easy to get an instance of Dynomite up and running.  Learn more about Dynomite: <https://github.com/zcalusic/dynomite>

## Usage

Pull image:

```
sudo docker pull zcalusic/dynomite
```

Run container with your ```dynomite.yml``` configuration file:

```
sudo docker run -d -p 8101:8101 -p 8102:8102 -p 22222:22222 -v /your/dynomite.yml:/usr/local/etc/dynomite.yml zcalusic/dynomite
```

You need to expose Dynomite TCP ports when starting the container.  Dynomite reads its configuration from ```/usr/local/etc/dynomite.yml```, and exits if it's missing.

Example configuration files are in ```/conf```.  To try out ```/conf/dynomite.yml``` (a single node with Redis on 127.0.0.1:6379, listening on 127.0.0.1 except for stats), run:

```
sudo docker run -d -p 22222:22222 zcalusic/dynomite dynomite -c /conf/dynomite.yml
```

## Building container image

Build image:

```
sudo make docker_build
```
