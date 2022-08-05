# Copyright © 2022 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/seaweedfs

SEAWEEDFS_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/seaweedfs/seaweedfs/releases/latest | jq -r '.tag_name'))
SEAWEEDFS_VERSION ?= $(SEAWEEDFS_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull golang:bullseye
	docker pull zcalusic/debian-bullseye
	docker build --build-arg SEAWEEDFS_VERSION=$(SEAWEEDFS_VERSION) -t $(DOCKER_IMAGE):$(SEAWEEDFS_VERSION) .
ifeq ($(SEAWEEDFS_VERSION),$(SEAWEEDFS_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(SEAWEEDFS_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(SEAWEEDFS_VERSION)
ifeq ($(SEAWEEDFS_VERSION),$(SEAWEEDFS_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
