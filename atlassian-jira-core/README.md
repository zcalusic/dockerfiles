# Run Atlassian JIRA Core in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/atlassian-jira-core.svg)](https://hub.docker.com/r/zcalusic/atlassian-jira-core/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/atlassian-jira-core.svg)](https://hub.docker.com/r/zcalusic/atlassian-jira-core/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/atlassian-jira-core.svg)](https://microbadger.com/images/zcalusic/atlassian-jira-core/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/atlassian-jira-core.svg)](https://microbadger.com/images/zcalusic/atlassian-jira-core/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/atlassian-jira-core.svg)](https://microbadger.com/images/zcalusic/atlassian-jira-core/)
[![License](https://images.microbadger.com/badges/license/zcalusic/atlassian-jira-core.svg)](https://microbadger.com/images/zcalusic/atlassian-jira-core/)

This Docker container makes it easy to get an instance of JIRA Core up and running.  Learn more about Atlassian JIRA Core: <https://www.atlassian.com/software/jira/core>

## Usage

Pull latest version:

```
sudo docker pull zcalusic/atlassian-jira-core
```

Pull specific version:

```
sudo docker pull zcalusic/atlassian-jira-core:7.5.0
```

Run container:

```
sudo docker run -d -p 8080:8080 -v your-jira-home:/var/atlassian/application-data/jira --name jira zcalusic/atlassian-jira-core
```

You need to mount host directory that will contain JIRA data and expose port 8080 when starting the container.  JIRA will run with ```daemon``` user privileges, and will take care of ownership of the files in your JIRA data directory mounted from the host.

### Memory / Heap size

If you need to override JIRA's default memory allocation parameters, you can control the minimum heap (Xms) and maximum heap (Xmx) via the environment variables:

* `JVM_MINIMUM_MEMORY`
  * The minimum heap size of the JVM (default: `384m`).

* `JVM_MAXIMUM_MEMORY`
  * The maximum heap size of the JVM (default: `768m`).

### Reverse proxy settings

If JIRA is run behind a reverse proxy server, then you need to specify extra options to make JIRA aware of the setup.  They can be controlled via the environment variables:

* `CATALINA_CONNECTOR_PROXYNAME`
  * The reverse proxy's fully qualified hostname (default: NONE).

* `CATALINA_CONNECTOR_PROXYPORT`
  * The reverse proxy's port number via which JIRA is accessed (default: NONE).

* `CATALINA_CONNECTOR_SCHEME`
  * The protocol via which JIRA is accessed (default: `http`).

* `CATALINA_CONNECTOR_SECURE`
  * Set `true` if `CATALINA_CONNECTOR_SCHEME` is `https` (default: `false`).

### JVM configuration

If you need to pass additional JVM arguments to JIRA, you can add them via the environment variable:

* `JVM_SUPPORT_RECOMMENDED_ARGS`
  * Additional JVM arguments for JIRA.

## Building container image

Build latest version:

```
sudo make docker_build
```

Build specific version:

```
sudo make docker_build JIRA_VERSION=7.5.0
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
