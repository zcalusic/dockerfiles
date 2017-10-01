# Debian 9 Stretch Docker base image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/debian-stretch.svg)](https://hub.docker.com/r/zcalusic/debian-stretch/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/debian-stretch.svg)](https://hub.docker.com/r/zcalusic/debian-stretch/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)
[![License](https://images.microbadger.com/badges/license/zcalusic/debian-stretch.svg)](https://microbadger.com/images/zcalusic/debian-stretch/)

Based on the official Debian 9 Stretch Docker base image.

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
[`docker-oracle-java8`](https://github.com/zcalusic/docker-oracle-java8) | Debian 9 Stretch Docker base image including Oracle Java(TM) Development Kit (JDK) 8 |

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
