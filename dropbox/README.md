# Run Dropbox Linux client in a Docker container

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/dropbox.svg)](https://hub.docker.com/r/zcalusic/dropbox/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/dropbox.svg)](https://hub.docker.com/r/zcalusic/dropbox/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/dropbox.svg)](https://microbadger.com/images/zcalusic/dropbox/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/dropbox.svg)](https://microbadger.com/images/zcalusic/dropbox/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/dropbox.svg)](https://microbadger.com/images/zcalusic/dropbox/)
[![License](https://images.microbadger.com/badges/license/zcalusic/dropbox.svg)](https://microbadger.com/images/zcalusic/dropbox/)

## Installation

* `sudo apt-get purge dropbox` - remove legacy Dropbox Debian package
  * dockerized Dropbox installs new CLI binary as `/usr/bin/dropbox`
* `sudo apt-get install docker-ce` - install [Docker CE](https://docs.docker.com/engine/installation/) engine
  * Docker installation from your Linux distribution might also work!
* `sudo make install`
  * pulls [Dropbox Docker image](https://hub.docker.com/r/zcalusic/dropbox/) from [Docker Hub](https://hub.docker.com/)
  * builds new CLI binary
  * installs new CLI binary

## Uninstallation

* `sudo make uninstall`
  * if you change your mind later, and want to remove Docker image and CLI binary

## Building container image

* `sudo make docker_build`
  * build container image with the provided [`Dockerfile`](https://github.com/zcalusic/docker-dropbox/blob/master/Dockerfile):

## Debugging container image

To inspect the image, start root shell:

* `docker run --rm -it zcalusic/dropbox /bin/bash`

To access running container, in the context of the user running it:

* `docker exec -it dropbox_username /bin/bash`

Or if you need root access:

* `docker exec -it -u root dropbox_username /bin/bash`

## Details

The Dropbox binary `/usr/bin/dropbox` is installed [setgid](https://en.wikipedia.org/wiki/Setuid) docker group, so that any user can launch Dropbox container (using Docker API generally requires superuser privileges).  An alternative to add users in the docker group is **much** less secure, because open access to the Docker API is effectively root access.

After various environment variables are passed and host directories mounted, the container is eventually run under the specific user privileges, and called dropbox_*username*.

## Linking to Dropbox account after first start

Check the container logs to get URL to authenticate with your Dropbox account.

* `docker logs dropbox_username`

You should see something like this:

```
This computer isn't linked to any Dropbox account...
Please visit https://www.dropbox.com/cli_link_nonce?nonce=3374878ebe768a3... to link this device.
```

Copy and paste the URL in a browser and login to your Dropbox account to associate.

## Contributors

Contributors are welcome, just open a new issue / pull request.

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
