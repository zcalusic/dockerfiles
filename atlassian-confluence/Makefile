# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/atlassian-confluence
JAVA_PACKAGE ?= server-jre-8u152-linux-x64.tar.gz

CONFLUENCE_CURRENT_VERSION := $(strip $(shell wget -qO- https://my.atlassian.com/download/feeds/current/confluence.json | sed -e 's/^downloads(//' -e 's/)$$//' | jq -r '.[0] | .version'))
CONFLUENCE_VERSION ?= $(CONFLUENCE_CURRENT_VERSION)

.PHONY: default server_jre docker_build docker_push clean

default: docker_build

server_jre:
ifeq ($(wildcard $(JAVA_PACKAGE)),)
	$(error Please download Server JRE Linux x64 tar.gz archive $(JAVA_PACKAGE) from http://www.oracle.com/technetwork/java/javase/downloads/server-jre8-downloads-2133154.html)
endif
	rm -rf java
	mkdir java
	tar xz --strip-components=1 -C java -f $(JAVA_PACKAGE)

docker_build: server_jre
	docker pull zcalusic/debian-stretch
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

clean:
	rm -rf *.tar.gz java
