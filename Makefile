# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/dropbox

.PHONY: default dropbox install uninstall docker_build docker_push clean

default: dropbox

dropbox:
	GOPATH=$(shell pwd) GOBIN=$(shell pwd)/usr/bin go install ./cmd/dropbox

install: dropbox
	docker pull zcalusic/dropbox
	install -o root -g docker -m 2755 usr/bin/dropbox /usr/bin/dropbox

uninstall:
	-docker rmi -f zcalusic/dropbox
	rm -f /usr/bin/dropbox

docker_build:
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
		--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
		--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
		--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
		-t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE):latest
	curl -X POST https://hooks.microbadger.com/images/zcalusic/dropbox/TlMSoYTkG4K_QCR88AjYP_McCyc=
	@echo

clean:
	rm -rf pkg usr/bin
