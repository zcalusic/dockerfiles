# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/qbittorrent

QBITTORRENT_VERSION := 4.4.5
LIBTORRENT_VERSION := 1.2.18

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bookworm
	docker build \
		--build-arg QBITTORRENT_VERSION=$(QBITTORRENT_VERSION) \
		--build-arg LIBTORRENT_VERSION=$(LIBTORRENT_VERSION) \
		-t $(DOCKER_IMAGE):$(QBITTORRENT_VERSION) .

docker_push:
	docker push $(DOCKER_IMAGE):$(QBITTORRENT_VERSION)
