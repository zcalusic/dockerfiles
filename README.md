# Build Rest Server release binaries

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/rest-server-builder.svg)](https://hub.docker.com/r/zcalusic/rest-server-builder/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/rest-server-builder.svg)](https://hub.docker.com/r/zcalusic/rest-server-builder/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/rest-server-builder.svg)](https://microbadger.com/images/zcalusic/rest-server-builder/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/rest-server-builder.svg)](https://microbadger.com/images/zcalusic/rest-server-builder/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/rest-server-builder.svg)](https://microbadger.com/images/zcalusic/rest-server-builder/)
[![License](https://images.microbadger.com/badges/license/zcalusic/rest-server-builder.svg)](https://microbadger.com/images/zcalusic/rest-server-builder/)

Using the official Docker [golang](https://hub.docker.com/_/golang/) container, tag 1.9-stretch, Go version 1.9 based on Debian 9 Stretch, amd64 architecture.

## Usage

Pull image:

```
sudo docker pull zcalusic/rest-server-builder
```

Build binaries for Rest Server version 0.9.4 (for example):

```
sudo docker run -it --rm -v /tmp/artifacts:/go/bin zcalusic/rest-server-builder build.sh 0.9.4
```

The binaries will be created in /tmp/artifacts directory.  If all went well, then you've produced exactly the same binaries as in the official release.

## Building container image

```
sudo make docker_build
```

## Thanks

The project was heavily inspired by [restic/builder](https://github.com/restic/builder) project from [Alexander Neumann](https://github.com/fd0)

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
