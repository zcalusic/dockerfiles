# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

DOCKER_IMAGE ?= zcalusic/observium-ce

VERSION_VAR := OBSERVIUM_CE_VERSION
# versions.php has a stale CE version (24.12 still in 2026-11), so read the
# VERSION file near the start of the tarball, without downloading all of it.
VERSION_CMD := wget -qO- https://www.observium.org/observium-community-latest.tar.gz | tar xzOf - --occurrence=1 observium/VERSION 2>/dev/null | sed -n 's/^Observium CE //p'

include ../docker.mk
