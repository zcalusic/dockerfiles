# Debian 8 Jessie Docker base image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/debian-jessie.svg)](https://hub.docker.com/r/zcalusic/debian-jessie/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/debian-jessie.svg)](https://hub.docker.com/r/zcalusic/debian-jessie/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/debian-jessie.svg)](https://microbadger.com/images/zcalusic/debian-jessie/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/debian-jessie.svg)](https://microbadger.com/images/zcalusic/debian-jessie/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/debian-jessie.svg)](https://microbadger.com/images/zcalusic/debian-jessie/)
[![License](https://images.microbadger.com/badges/license/zcalusic/debian-jessie.svg)](https://microbadger.com/images/zcalusic/debian-jessie/)

Based on the official Debian 8 Jessie Docker base image.

## Features

* Locale preset to C.UTF-8
  * `LC_ALL=C.UTF-8`
  * `LANG=C.UTF-8`
  * `LANGUAGE=C.UTF-8`

* Additional Debian packages:
  * `apt-transport-https`
    * https download transport for APT
  * `apt-utils`
    * optimize installation of additional Debian packages
  * `ca-certificates`
    * verify communication when downloading third-party software
  * `dnsutils`
    * client programs related to DNS
  * `dumb-init`
    * minimal init system for containers, killing zombies, redirecting signals... (borrowed from Stretch)
  * `gosu`
    * robust setuid + setgid + setgroups + exec with sane tty and signal forwarding behavior (borrowed from Stretch)
  * `iputils-ping`
    * tools to test the reachability of network hosts
  * `jq`
    * lightweight and flexible command-line JSON processor
  * `less`
    * less is more, more or less
  * `net-tools`
    * for the gray-bearded among us
  * `netcat-openbsd`
    * TCP/IP swiss army knife
  * `telnet`
    * useful to help debug network issues
  * `vim-tiny`
    * vi editor - compact version
  * `wget`
    * retrieves files from the web, indispensable
  * `xmlstarlet`
    * command line XML toolkit

## Usage

Pull image:

```
sudo docker pull zcalusic/debian-jessie
```

Interactive shell:

```
sudo docker run --rm -it zcalusic/debian-jessie
```

As base image in your own Dockerfile:

```
FROM zcalusic/debian-jessie
```

## Building container image

```
sudo make docker_build
```
