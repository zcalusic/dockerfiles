# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/observium-ce

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-stretch
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
		--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
		--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
		--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
		-t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE):latest
	curl -X POST https://hooks.microbadger.com/images/zcalusic/observium-ce/0PPk59EVH7UkUilUTf5CI5ETV_8=
	@echo
