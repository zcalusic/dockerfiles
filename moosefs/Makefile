# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/moosefs

MOOSEFS_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/moosefs/moosefs/releases/latest | jq -r '.tag_name // empty'))
MOOSEFS_VERSION ?= $(MOOSEFS_CURRENT_VERSION)

ifeq ($(MOOSEFS_VERSION),)
$(error Could not look up the latest moosefs version, set MOOSEFS_VERSION explicitly)
endif

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker build --pull --no-cache --build-arg MOOSEFS_VERSION=$(MOOSEFS_VERSION) -t $(DOCKER_IMAGE):$(MOOSEFS_VERSION) .
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(MOOSEFS_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(MOOSEFS_VERSION)
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
