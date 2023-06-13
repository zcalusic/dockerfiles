# Copyright © 2022 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/geth

GETH_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/ethereum/go-ethereum/releases/latest | jq -r '.tag_name'))
GETH_VERSION ?= $(GETH_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull golang
	docker pull zcalusic/debian-bookworm
	docker build --build-arg GETH_VERSION=$(GETH_VERSION) -t $(DOCKER_IMAGE):$(GETH_VERSION) .
ifeq ($(GETH_VERSION),$(GETH_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(GETH_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(GETH_VERSION)
ifeq ($(GETH_VERSION),$(GETH_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
