# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/btcd

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull golang:buster
	docker pull zcalusic/debian-buster
	docker build -t $(DOCKER_IMAGE):latest .

docker_push:
	docker push $(DOCKER_IMAGE):latest
