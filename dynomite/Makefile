# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/dynomite

DYNOMITE_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/zcalusic/dynomite/releases/latest | jq -r '.tag_name'))
DYNOMITE_VERSION ?= $(DYNOMITE_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bookworm
	docker build --build-arg DYNOMITE_VERSION=$(DYNOMITE_VERSION) -t $(DOCKER_IMAGE):$(DYNOMITE_VERSION) .
ifeq ($(DYNOMITE_VERSION),$(DYNOMITE_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(DYNOMITE_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(DYNOMITE_VERSION)
ifeq ($(DYNOMITE_VERSION),$(DYNOMITE_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
