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
