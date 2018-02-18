# Run PowerDNS Recursor in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/pdns-recursor.svg)](https://hub.docker.com/r/zcalusic/pdns-recursor/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/pdns-recursor.svg)](https://hub.docker.com/r/zcalusic/pdns-recursor/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/pdns-recursor.svg)](https://microbadger.com/images/zcalusic/pdns-recursor/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/pdns-recursor.svg)](https://microbadger.com/images/zcalusic/pdns-recursor/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/pdns-recursor.svg)](https://microbadger.com/images/zcalusic/pdns-recursor/)
[![License](https://images.microbadger.com/badges/license/zcalusic/pdns-recursor.svg)](https://microbadger.com/images/zcalusic/pdns-recursor/)

PowerDNS Recursor is a high-end, high-performance resolving name server.  Learn more about PowerDNS Recursor: <https://www.powerdns.com/recursor.html>

## Usage

Pull image:

```
sudo docker pull zcalusic/pdns-recursor
```

Run container:

```
sudo docker run -d -p 53:53 -p 53:53/udp --name pdns_recursor zcalusic/pdns-recursor
```

Run container with additional arguments:

```
sudo docker run -d -p 53:53 -p 53:53/udp --name pdns_recursor zcalusic/pdns-recursor pdns_recursor --quiet=no --allow-from=0.0.0.0/0
```

PowerDNS Recursor will run with ```daemon``` user privileges
