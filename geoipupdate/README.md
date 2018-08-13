# Run GeoIP update in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/geoipupdate.svg)](https://hub.docker.com/r/zcalusic/geoipupdate/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/geoipupdate.svg)](https://hub.docker.com/r/zcalusic/geoipupdate/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/geoipupdate.svg)](https://microbadger.com/images/zcalusic/geoipupdate/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/geoipupdate.svg)](https://microbadger.com/images/zcalusic/geoipupdate/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/geoipupdate.svg)](https://microbadger.com/images/zcalusic/geoipupdate/)
[![License](https://images.microbadger.com/badges/license/zcalusic/geoipupdate.svg)](https://microbadger.com/images/zcalusic/geoipupdate/)

This Docker container makes it easy to download MaxMind GeoLite2 free binary databases.  Learn more about geoipupdate: <https://dev.maxmind.com/geoip/geoipupdate/>

## Pull image

```
sudo docker pull zcalusic/geoipupdate
```

## Running container

```
sudo docker run --rm -it -v /tmp/geoip:/data zcalusic/geoipupdate
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
