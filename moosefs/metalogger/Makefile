# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/moosefs-metalogger

.PHONY: default docker_build docker_push clean

default: docker_build

docker_build:
	cat ../Dockerfile.in Dockerfile.head > Dockerfile
	wget -q -O- https://raw.githubusercontent.com/moosefs/moosefs/v$(MOOSEFS_VERSION)/debian/moosefs-metalogger.install | awk '{printf "COPY --from=builder /%s /%s\n", $$0, $$0}' >> Dockerfile
	cat Dockerfile.tail >> Dockerfile
	docker build \
		--build-arg URL=$(strip $(shell git config --get remote.origin.url | sed 's/\.git$$//')) \
	 	--build-arg VCS_URL=$(strip $(shell git config --get remote.origin.url)) \
	 	--build-arg VCS_REF=$(strip $(shell git rev-parse --short HEAD)) \
	 	--build-arg BUILD_DATE=$(strip $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")) \
	 	--build-arg MOOSEFS_VERSION=$(MOOSEFS_VERSION) \
	 	-t $(DOCKER_IMAGE):$(MOOSEFS_VERSION) .

docker_push:
	docker push $(DOCKER_IMAGE):$(MOOSEFS_VERSION)
	curl -X POST https://hooks.microbadger.com/images/zcalusic/moosefs-metalogger/vbJffIQFanS1v12zN8Sg6PIMUoM=
	@echo

clean:
	rm -f Dockerfile
