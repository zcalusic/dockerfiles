# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/rest-server

REST_SERVER_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/zcalusic/rest-server/releases/latest | jq -r '.tag_name'))
REST_SERVER_VERSION ?= $(REST_SERVER_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull golang
	docker pull zcalusic/debian-bookworm
	docker build --build-arg REST_SERVER_VERSION=$(REST_SERVER_VERSION) -t $(DOCKER_IMAGE):$(REST_SERVER_VERSION) .
ifeq ($(REST_SERVER_VERSION),$(REST_SERVER_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(REST_SERVER_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(REST_SERVER_VERSION)
ifeq ($(REST_SERVER_VERSION),$(REST_SERVER_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
