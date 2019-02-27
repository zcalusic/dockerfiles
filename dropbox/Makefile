# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/dropbox

.PHONY: default docker_build docker_push build install uninstall clean

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
	curl -X POST https://hooks.microbadger.com/images/zcalusic/dropbox/TlMSoYTkG4K_QCR88AjYP_McCyc=
	@echo

dropbox: dropbox.go
	go get github.com/golang/dep/cmd/dep
	dep ensure
	go build

build:
	docker run --rm -v $(shell pwd):/go/src/dropbox -w /go/src/dropbox golang:stretch make dropbox

install: build
	docker pull zcalusic/dropbox
	install -o root -g docker -m 2755 dropbox /usr/bin/dropbox

uninstall:
	rm -f /usr/bin/dropbox
	-docker rmi -f zcalusic/dropbox

clean:
	rm -rf dropbox vendor
