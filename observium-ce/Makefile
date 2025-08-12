# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/observium-ce

OBSERVIUM_CE_VERSION := $(strip $(shell wget -qO- https://www.observium.org/versions.php | jq -r '.ce.version'))

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-trixie
	docker build -t $(DOCKER_IMAGE):$(OBSERVIUM_CE_VERSION) .
	docker tag $(DOCKER_IMAGE):$(OBSERVIUM_CE_VERSION) $(DOCKER_IMAGE):latest

docker_push:
	docker push $(DOCKER_IMAGE):$(OBSERVIUM_CE_VERSION)
	docker push $(DOCKER_IMAGE):latest
