# Copyright © 2018 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/vpnc

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bookworm
	docker build -t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE):latest
