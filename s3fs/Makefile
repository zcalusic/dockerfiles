# Copyright © 2018 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/s3fs

S3FS_CURRENT_VERSION := $(strip $(shell wget -qO- https://api.github.com/repos/s3fs-fuse/s3fs-fuse/releases/latest | jq -r '.tag_name'))
S3FS_VERSION ?= $(S3FS_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-buster
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
		--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
		--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
		--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
		--build-arg S3FS_VERSION=$(S3FS_VERSION) \
		-t $(DOCKER_IMAGE):$(S3FS_VERSION) .
ifeq ($(S3FS_VERSION),$(S3FS_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(S3FS_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(S3FS_VERSION)
ifeq ($(S3FS_VERSION),$(S3FS_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
	curl -X POST https://hooks.microbadger.com/images/zcalusic/s3fs/lJXm0kKFfa--WOY4SKe7gwLs8VU=
	@echo
