# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/moosefs

MOOSEFS_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/moosefs/moosefs/releases/latest | jq -r '.tag_name'))
MOOSEFS_VERSION ?= $(MOOSEFS_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-trixie
	docker build --build-arg MOOSEFS_VERSION=$(MOOSEFS_VERSION) -t $(DOCKER_IMAGE):$(MOOSEFS_VERSION) .
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(MOOSEFS_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(MOOSEFS_VERSION)
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
