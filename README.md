# Run Transmission in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/transmission.svg)](https://hub.docker.com/r/zcalusic/transmission/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/transmission.svg)](https://hub.docker.com/r/zcalusic/transmission/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/transmission.svg)](https://microbadger.com/images/zcalusic/transmission/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/transmission.svg)](https://microbadger.com/images/zcalusic/transmission/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/transmission.svg)](https://microbadger.com/images/zcalusic/transmission/)
[![License](https://images.microbadger.com/badges/license/zcalusic/transmission.svg)](https://microbadger.com/images/zcalusic/transmission/)

This Docker container makes it easy to get an instance of Transmission up and running.  Learn more about Transmission: <https://transmissionbt.com/>

## Usage

Pull image:

```
sudo docker pull zcalusic/transmission
```

Run container:

```
sudo docker run -d \
     -u 1000:100 \
     -p 9091 \
     -p 51413:51413 \
     -p 51413:51413/udp \
     -v your-config-dir:/config \
     -v your-data-dir:/data \
     -e TZ=Europe/Zagreb \
     --name transmission \
     zcalusic/transmission
```

You need to mount host directories that will contain Transmission configuration and data files and expose RPC/Web and peer ports when starting the container.  Also, don't forget to specify correct user UID & GID, and make sure config & data directories are created with correct ownership and modes BEFORE container is started!  Setting proper timezone helps to have logs in your local time.

During initial start, when there are no configuration files yet, Transmission will generate default ones.  Whenever you're editing settings manually, make sure the container is stopped, otherwise changes WILL be lost!

## Building container image

Build image:

```
sudo make docker_build
```

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
