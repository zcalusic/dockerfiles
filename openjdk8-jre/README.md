# OpenJDK 8 HotSpot JRE Docker base image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/openjdk8-jre.svg)](https://hub.docker.com/r/zcalusic/openjdk8-jre/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/openjdk8-jre.svg)](https://hub.docker.com/r/zcalusic/openjdk8-jre/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/openjdk8-jre.svg)](https://microbadger.com/images/zcalusic/openjdk8-jre/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/openjdk8-jre.svg)](https://microbadger.com/images/zcalusic/openjdk8-jre/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/openjdk8-jre.svg)](https://microbadger.com/images/zcalusic/openjdk8-jre/)
[![License](https://images.microbadger.com/badges/license/zcalusic/openjdk8-jre.svg)](https://microbadger.com/images/zcalusic/openjdk8-jre/)

Based on AdoptOpenJDK prebuilt OpenJDK binaries + Apache Tomcat Native Library.

Learn more about AdoptOpenJDK: <https://adoptopenjdk.net/>  
Learn more about Apache Tomcat Native Library: <https://tomcat.apache.org/native-doc/>

## Usage

Pull image:

```
sudo docker pull zcalusic/openjdk8-jre
```

Interactive shell:

```
sudo docker run --rm -it zcalusic/openjdk8-jre
```

As base image in your own Dockerfile:

```
FROM zcalusic/openjdk8-jre
```

## Building container image

```
sudo make docker_build
```
