# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

MOOSEFS_VERSION ?= 3.0.99

export MOOSEFS_VERSION

.PHONY: default docker_build docker_push clean

default: docker_build

docker_build:
	docker pull zcalusic/debian-stretch
	make -C master docker_build
	make -C metalogger docker_build
	make -C chunkserver docker_build
	make -C cgi docker_build

docker_push:
	make -C master docker_push
	make -C metalogger docker_push
	make -C chunkserver docker_push
	make -C cgi docker_push

clean:
	make -C master clean
	make -C metalogger clean
	make -C chunkserver clean
	make -C cgi clean
