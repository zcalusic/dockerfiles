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
