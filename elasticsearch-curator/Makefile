# Copyright © 2021 Zlatko Čalušić

DOCKER_IMAGE ?= zcalusic/elasticsearch-curator

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker pull zcalusic/debian-bullseye
	docker build -t $(DOCKER_IMAGE) .

docker_push:
	docker push $(DOCKER_IMAGE):latest
