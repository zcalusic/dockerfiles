# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/chia

CHIA_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/Chia-Network/chia-blockchain/releases/latest | jq -r '.tag_name'))
CHIA_VERSION ?= $(CHIA_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bullseye
	docker build --build-arg CHIA_VERSION=$(CHIA_VERSION) -t $(DOCKER_IMAGE):$(CHIA_VERSION) .
ifeq ($(CHIA_VERSION),$(CHIA_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(CHIA_VERSION) $(DOCKER_IMAGE):latest
endif


docker_push:
	docker push $(DOCKER_IMAGE):$(CHIA_VERSION)
ifeq ($(CHIA_VERSION),$(CHIA_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif

