# Copyright © 2020 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/sabnzbd

SABNZBD_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/sabnzbd/sabnzbd/releases/latest | jq -r '.tag_name'))
SABNZBD_VERSION ?= $(SABNZBD_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bullseye
	docker build --build-arg SABNZBD_VERSION=$(SABNZBD_VERSION) -t $(DOCKER_IMAGE):$(SABNZBD_VERSION) .
ifeq ($(SABNZBD_VERSION),$(SABNZBD_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(SABNZBD_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(SABNZBD_VERSION)
ifeq ($(SABNZBD_VERSION),$(SABNZBD_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
