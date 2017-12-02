# Run Atlassian Bamboo in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/atlassian-bamboo.svg)](https://hub.docker.com/r/zcalusic/atlassian-bamboo/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/atlassian-bamboo.svg)](https://hub.docker.com/r/zcalusic/atlassian-bamboo/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/atlassian-bamboo.svg)](https://microbadger.com/images/zcalusic/atlassian-bamboo/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/atlassian-bamboo.svg)](https://microbadger.com/images/zcalusic/atlassian-bamboo/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/atlassian-bamboo.svg)](https://microbadger.com/images/zcalusic/atlassian-bamboo/)
[![License](https://images.microbadger.com/badges/license/zcalusic/atlassian-bamboo.svg)](https://microbadger.com/images/zcalusic/atlassian-bamboo/)

This Docker container makes it easy to get an instance of Bamboo up and running.  Learn more about Atlassian Bamboo: <https://www.atlassian.com/software/bamboo>

## Usage

Pull latest version:

```
sudo docker pull zcalusic/atlassian-bamboo
```

Pull specific version:

```
sudo docker pull zcalusic/atlassian-bamboo:6.2.1
```

Run container:

```
sudo docker run -d -p 8085:8085 -v your-bamboo-home:/var/atlassian/application-data/bamboo --name bamboo zcalusic/atlassian-bamboo
```

You need to mount host directory that will contain Bamboo data and expose port 8085 when starting the container.  Bamboo will run with ```daemon``` user privileges, and will take care of ownership of the files in your Bamboo data directory mounted from the host.

### Memory / Heap size

If you need to override Bamboo's default memory allocation parameters, you can control the minimum heap (Xms) and maximum heap (Xmx) via the environment variables:

* `JVM_MINIMUM_MEMORY`
  * The minimum heap size of the JVM (default: `512m`).

* `JVM_MAXIMUM_MEMORY`
  * The maximum heap size of the JVM (default: `1024m`).

### Reverse proxy settings

If Bamboo is run behind a reverse proxy server, then you need to specify extra options to make Bamboo aware of the setup.  They can be controlled via the environment variables:

* `CATALINA_CONNECTOR_PROXYNAME`
  * The reverse proxy's fully qualified hostname (default: NONE).

* `CATALINA_CONNECTOR_PROXYPORT`
  * The reverse proxy's port number via which Bamboo is accessed (default: NONE).

* `CATALINA_CONNECTOR_SCHEME`
  * The protocol via which Bamboo is accessed (default: `http`).

* `CATALINA_CONNECTOR_SECURE`
  * Set `true` if `CATALINA_CONNECTOR_SCHEME` is `https` (default: `false`).

### JVM configuration

If you need to pass additional JVM arguments to Bamboo, you can add them via the environment variable:

* `JVM_SUPPORT_RECOMMENDED_ARGS`
  * Additional JVM arguments for Bamboo.

## Building container image

Build latest version:

```
sudo make docker_build
```

Build specific version:

```
sudo make docker_build BAMBOO_VERSION=6.2.1
```
