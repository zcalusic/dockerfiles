# Copyright © 2022 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/prysm

PRYSM_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/prysmaticlabs/prysm/releases/latest | jq -r '.tag_name'))
PRYSM_VERSION ?= $(PRYSM_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bookworm
	docker build --build-arg PRYSM_VERSION=$(PRYSM_VERSION) -t $(DOCKER_IMAGE):$(PRYSM_VERSION) .
ifeq ($(PRYSM_VERSION),$(PRYSM_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(PRYSM_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(PRYSM_VERSION)
ifeq ($(PRYSM_VERSION),$(PRYSM_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
