# Run PowerDNS Authoritative Server in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/pdns.svg)](https://hub.docker.com/r/zcalusic/pdns/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/pdns.svg)](https://hub.docker.com/r/zcalusic/pdns/)

Learn more about PowerDNS Authoritative Server: <https://www.powerdns.com/auth.html>

## Usage

Pull image:

```
sudo docker pull zcalusic/pdns
```

Run container:

```
sudo docker run -d -p 53:53 -p 53:53/udp --name pdns zcalusic/pdns
```

Run container with additional arguments:

```
sudo docker run -d -p 53:53 -p 53:53/udp --name pdns zcalusic/pdns pdns_server --query-logging=yes
```

PowerDNS server will run with ```daemon``` user privileges.
