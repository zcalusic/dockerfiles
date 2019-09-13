# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

MOOSEFS_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/moosefs/moosefs/releases/latest | jq -r '.tag_name'))
MOOSEFS_VERSION ?= $(MOOSEFS_CURRENT_VERSION)

export MOOSEFS_CURRENT_VERSION
export MOOSEFS_VERSION

.PHONY: default docker_build docker_push clean

default: docker_build

docker_build:
	docker pull zcalusic/debian-buster
	make -C master docker_build
	make -C metalogger docker_build
	make -C chunkserver docker_build
	make -C cgi docker_build
	make -C cli docker_build
	make -C client docker_build

docker_push:
	make -C master docker_push
	make -C metalogger docker_push
	make -C chunkserver docker_push
	make -C cgi docker_push
	make -C cli docker_push
	make -C client docker_push

clean:
	make -C master clean
	make -C metalogger clean
	make -C chunkserver clean
	make -C cgi clean
	make -C cli clean
	make -C client clean
