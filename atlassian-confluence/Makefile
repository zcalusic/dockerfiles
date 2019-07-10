# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/atlassian-confluence

CONFLUENCE_CURRENT_VERSION := $(strip $(shell wget -qO- https://my.atlassian.com/download/feeds/current/confluence.json | sed -e 's/^downloads(//' -e 's/)$$//' | jq -r '.[0] | .version'))
CONFLUENCE_VERSION ?= $(CONFLUENCE_CURRENT_VERSION)

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-buster
	docker pull zcalusic/openjdk8-jre
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
		--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
		--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
		--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
		--build-arg CONFLUENCE_VERSION=$(CONFLUENCE_VERSION) \
		-t $(DOCKER_IMAGE):$(CONFLUENCE_VERSION) .
ifeq ($(CONFLUENCE_VERSION),$(CONFLUENCE_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(CONFLUENCE_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(CONFLUENCE_VERSION)
ifeq ($(CONFLUENCE_VERSION),$(CONFLUENCE_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
	curl -X POST https://hooks.microbadger.com/images/zcalusic/atlassian-confluence/jcpZXTnPuqOM21WdOA0HaVtUnN8=
	@echo
