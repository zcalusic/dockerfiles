# Copyright © 2018 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/rclone

RCLONE_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/rclone/rclone/releases/latest | jq -r '.tag_name'))
RCLONE_VERSION ?= $(RCLONE_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull golang
	docker pull zcalusic/debian-bookworm
	docker build --build-arg RCLONE_VERSION=$(RCLONE_VERSION) -t $(DOCKER_IMAGE):$(RCLONE_VERSION) .
ifeq ($(RCLONE_VERSION),$(RCLONE_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(RCLONE_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(RCLONE_VERSION)
ifeq ($(RCLONE_VERSION),$(RCLONE_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
