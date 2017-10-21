# Debian 9 Stretch Docker base image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/debian-stretch.svg)](https://hub.docker.com/r/zcalusic/debian-stretch/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/debian-stretch.svg)](https://hub.docker.com/r/zcalusic/debian-stretch/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![License](https://images.microbadger.com/badges/license/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)

Based on the official Debian 9 Stretch Docker base image.

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
  * `dirmngr`
    * required by GnuPG v2, see below
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
  * `procps`
    * /proc file system utilities, indispensable
  * `telnet`
    * useful to help debug network issues
  * `tzdata`
    * time zone and daylight-saving time data, time is money
  * `vim-tiny`
    * vi editor - compact version
  * `wget`
    * retrieves files from the web, indispensable
  * `xmlstarlet`
    * command line XML toolkit

## Usage

Pull image:

```
sudo docker pull zcalusic/debian-stretch
```

Interactive shell:

```
sudo docker run --rm -it zcalusic/debian-stretch
```

As base image in your own Dockerfile:

```
FROM zcalusic/debian-stretch
```

## Building container image

```
sudo make docker_build
```

## Users

Project | Description |
--------|-------------|
[`docker-dropbox`](https://github.com/zcalusic/docker-dropbox) | Run Dropbox Linux client in a Docker container |
[`docker-syncthing`](https://github.com/zcalusic/docker-syncthing) | Run Syncthing in a Docker container |
[`docker-observium-ce`](https://github.com/zcalusic/docker-observium-ce) | Run Observium Community Edition in a Docker container |
[`docker-atlassian-bamboo`](https://github.com/zcalusic/docker-atlassian-bamboo) | Run Atlassian Bamboo in a Docker Container |
[`docker-atlassian-confluence`](https://github.com/zcalusic/docker-atlassian-confluence) | Run Atlassian Confluence in a Docker Container |
[`docker-atlassian-jira-core`](https://github.com/zcalusic/docker-atlassian-jira-core) | Run Atlassian JIRA Core in a Docker Container |

## License

```
The MIT License (MIT)

Copyright © 2017 Zlatko Čalušić

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
