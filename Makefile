# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/atlassian-confluence
JAVA_PACKAGE = server-jre-8u144-linux-x64.tar.gz

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
		-t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE):latest
	curl -X POST https://hooks.microbadger.com/images/zcalusic/atlassian-confluence/jcpZXTnPuqOM21WdOA0HaVtUnN8=
	@echo

clean:
	rm -rf *.tar.gz java
