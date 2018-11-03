# Run GeoIP update in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/geoip-update.svg)](https://hub.docker.com/r/zcalusic/geoip-update/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/geoip-update.svg)](https://hub.docker.com/r/zcalusic/geoip-update/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/geoip-update.svg)](https://microbadger.com/images/zcalusic/geoip-update/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/geoip-update.svg)](https://microbadger.com/images/zcalusic/geoip-update/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/geoip-update.svg)](https://microbadger.com/images/zcalusic/geoip-update/)
[![License](https://images.microbadger.com/badges/license/zcalusic/geoip-update.svg)](https://microbadger.com/images/zcalusic/geoip-update/)

This Docker container makes it easy to download MaxMind GeoLite2 free binary databases.  Learn more about geoip-update: <https://dev.maxmind.com/geoip/geoipupdate/>

## Pull image

```
sudo docker pull zcalusic/geoip-update
```

## Running container

```
sudo docker run --rm -it -v /tmp/geoip:/data zcalusic/geoip-update
```

The GeoLite2 free binary databases will be downloaded to /tmp/geoip directory.

```
-rw-r--r--    1 root     root       6153034 Aug  7 11:32 GeoLite2-ASN.mmdb
-rw-r--r--    1 root     root      66251171 Aug  8 00:18 GeoLite2-City.mmdb
-rw-r--r--    1 root     root       3465676 Aug  8 00:17 GeoLite2-Country.mmdb
```

## Building container image

```
sudo make docker_build
```
