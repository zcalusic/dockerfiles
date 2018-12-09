# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/moosefs-chunkserver

.PHONY: default docker_build docker_push clean

default: docker_build

docker_build:
	cat ../Dockerfile.in Dockerfile.head > Dockerfile
	wget -q -O- https://raw.githubusercontent.com/moosefs/moosefs/$(MOOSEFS_VERSION)/debian/moosefs-chunkserver.install | awk '{printf "COPY --from=builder /%s /%s\n", $$0, $$0}' >> Dockerfile
	cat Dockerfile.tail >> Dockerfile
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
		--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
		--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
		--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
		--build-arg MOOSEFS_VERSION=$(MOOSEFS_VERSION) \
		-t $(DOCKER_IMAGE):$(MOOSEFS_VERSION) .
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker tag $(DOCKER_IMAGE):$(MOOSEFS_VERSION) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(MOOSEFS_VERSION)
ifeq ($(MOOSEFS_VERSION),$(MOOSEFS_CURRENT_VERSION))
	docker push $(DOCKER_IMAGE):latest
endif
	curl -X POST https://hooks.microbadger.com/images/zcalusic/moosefs-chunkserver/6DmjNnF4Xd-UTQipB1DMOagW0rM=
	@echo

clean:
	rm -f Dockerfile
