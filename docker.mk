# Copyright © 2026 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#
# Shared build rules, included at the end of each image's Makefile.
#
#   DOCKER_IMAGE  image name, required
#   VERSION_VAR   name of the version variable, e.g. BITCOIN_VERSION, also
#                 passed to docker build as a build arg; unset for images
#                 that are only tagged latest
#   GITHUB_REPO   owner/repo whose latest release tag is the current version,
#                 read from the github.com redirect rather than the API, which
#                 allows only 60 unauthenticated requests per hour
#   VERSION_URL   or a URL that returns the current version as JSON ...
#   VERSION_JQ    ... and the jq filter that extracts it
#
# A versioned image is tagged with its version, and also latest when that is
# the current version. Build an older one with e.g. make BITCOIN_VERSION=v30.0.
#
# Images are labelled with the OCI source annotation pointing to this repo,
# versioned images also with their version, and images built from a clean
# checkout (no changes in the image directory or here) with the git commit;
# other builds get an empty revision label.

DOCKER_BUILD_FLAGS := --pull --no-cache
DOCKER_BUILD_FLAGS += --label org.opencontainers.image.source=https://github.com/zcalusic/dockerfiles

GIT_REVISION := $(shell git rev-parse -q --verify HEAD 2>/dev/null)
GIT_CHANGES := $(shell git status --porcelain -- . ../docker.mk 2>/dev/null)

ifneq ($(GIT_CHANGES),)
GIT_REVISION :=
endif

# Always set the revision label, empty if unknown, so that an image doesn't
# inherit its base image's revision.
DOCKER_BUILD_FLAGS += --label org.opencontainers.image.revision=$(GIT_REVISION)

ifdef VERSION_VAR

ifdef GITHUB_REPO
VERSION_URL := https://github.com/$(GITHUB_REPO)/releases/latest
CURRENT_VERSION := $(strip $(shell wget -q --max-redirect=0 --server-response $(VERSION_URL) 2>&1 | sed -n 's|^ *Location: .*/releases/tag/||p'))
else
CURRENT_VERSION := $(strip $(shell wget -qO- $(VERSION_URL) | jq -r '$(VERSION_JQ) // empty'))
endif
$(VERSION_VAR) ?= $(CURRENT_VERSION)

ifeq ($($(VERSION_VAR)),)
$(error Could not look up $(VERSION_VAR) from $(VERSION_URL), set it explicitly)
endif

DOCKER_TAG := $($(VERSION_VAR))
DOCKER_BUILD_FLAGS += --build-arg $(VERSION_VAR)=$(DOCKER_TAG)
DOCKER_BUILD_FLAGS += --label org.opencontainers.image.version=$(DOCKER_TAG)

ifeq ($(DOCKER_TAG),$(CURRENT_VERSION))
TAG_LATEST := yes
endif

else

DOCKER_TAG := latest

endif

.PHONY: default docker_build docker_push

default: docker_build

docker_build:
	docker build $(DOCKER_BUILD_FLAGS) -t $(DOCKER_IMAGE):$(DOCKER_TAG) .
ifdef TAG_LATEST
	docker tag $(DOCKER_IMAGE):$(DOCKER_TAG) $(DOCKER_IMAGE):latest
endif

docker_push:
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
ifdef TAG_LATEST
	docker push $(DOCKER_IMAGE):latest
endif
