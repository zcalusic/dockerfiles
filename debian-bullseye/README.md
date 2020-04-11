# Debian 11 Bullseye Docker base image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/debian-bullseye.svg)](https://hub.docker.com/r/zcalusic/debian-bullseye/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/debian-bullseye.svg)](https://hub.docker.com/r/zcalusic/debian-bullseye/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/debian-bullseye.svg)](https://microbadger.com/images/zcalusic/debian-bullseye/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/debian-bullseye.svg)](https://microbadger.com/images/zcalusic/debian-bullseye/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/debian-bullseye.svg)](https://microbadger.com/images/zcalusic/debian-bullseye/)
[![License](https://images.microbadger.com/badges/license/zcalusic/debian-bullseye.svg)](https://microbadger.com/images/zcalusic/debian-bullseye/)

Based on the official Debian 11 Bullseye Docker base image.

## Features

* Locale preset to C.UTF-8
  * `LC_ALL=C.UTF-8`
  * `LANG=C.UTF-8`
  * `LANGUAGE=C.UTF-8`

* Additional Debian packages:
  * `apt-utils`
    * optimize installation of additional Debian packages
  * `ca-certificates`
    * verify communication when downloading third-party software
  * `dirmngr`
    * required by GnuPG v2, see below
  * `dnsutils`
    * client programs related to DNS
  * `dumb-init`
    * minimal init system for containers, killing zombies, redirecting signals...
  * `gnupg`
    * verify authentication keys from third-party repositories
  * `gosu`
    * robust setuid + setgid + setgroups + exec with sane tty and signal forwarding behavior
  * `jq`
    * lightweight and flexible command-line JSON processor
  * `less`
    * less is more, more or less
  * `net-tools`
    * for the gray-bearded among us
  * `netcat-openbsd`
    * TCP/IP swiss army knife
  * `procps`
    * /proc file system utilities, indispensable
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
sudo docker pull zcalusic/debian-bullseye
```

Interactive shell:

```
sudo docker run --rm -it zcalusic/debian-bullseye
```

As base image in your own Dockerfile:

```
FROM zcalusic/debian-bullseye
```

## Building container image

```
sudo make docker_build
```
