# Run Chainweb Node in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/chainweb-node.svg)](https://hub.docker.com/r/zcalusic/chainweb-node/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/chainweb-node.svg)](https://hub.docker.com/r/zcalusic/chainweb-node/)

Run [Chainweb Node](https://github.com/kadena-io/chainweb-node) in a Docker container.

## Features

- based on [the official image](https://github.com/kadena-io/chainweb-node-docker), with just dumb-init added as entrypoint, which enables:
  - properly reaping zombie (defunct) processes
  - graceful container shutdown (RocksDB & SQLite databases closed cleanly on exit)

## Usage

Pull image:

```
sudo docker pull zcalusic/chainweb-node
```

Run container:

Consult the official image [documentation](https://github.com/kadena-io/chainweb-node-docker/blob/master/README.md).

## Building container image

Build image:

```
sudo make docker_build
```
