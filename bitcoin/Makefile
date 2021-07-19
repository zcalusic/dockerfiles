# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/bitcoin

BITCOIN_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/bitcoin/bitcoin/releases/latest | jq -r '.tag_name'))
BITCOIN_VERSION ?= $(BITCOIN_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bullseye
	docker build --build-arg BITCOIN_VERSION=$(BITCOIN_VERSION) -t $(DOCKER_IMAGE):$(BITCOIN_VERSION) .
ifeq ($(BITCOIN_VERSION),$(BITCOIN_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(BITCOIN_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(BITCOIN_VERSION)
ifeq ($(BITCOIN_VERSION),$(BITCOIN_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
