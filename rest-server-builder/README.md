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
