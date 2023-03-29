FROM zcalusic/debian-bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG PRYSM_VERSION

ENV CGO_LDFLAGS -O2 -z noexecstack

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       gpg \
       patch \
       python-is-python3 \
    && wget --dot-style=mega -qO- https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/bazel-archive.gpg \
    && echo "deb https://storage.googleapis.com/bazel-apt stable jdk1.8" > /etc/apt/sources.list.d/bazel.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends bazel-6.1.0 \
    && cd /usr/src \
    && git clone --branch "$PRYSM_VERSION" --depth 1 https://github.com/prysmaticlabs/prysm \
    && cd prysm \
    && bazel-6.1.0 build //cmd/beacon-chain --config=release \
    && strip bazel-bin/cmd/beacon-chain/beacon-chain_/beacon-chain

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /usr/src/prysm/bazel-bin/cmd/beacon-chain/beacon-chain_/beacon-chain /usr/bin

EXPOSE 12000/udp 13000

CMD [ "beacon-chain" ]
