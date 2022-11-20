FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG PRYSM_VERSION

ENV CGO_LDFLAGS -g -O2 -z noexecstack

RUN cd src \
    && git clone --branch "$PRYSM_VERSION" --depth 1 https://github.com/prysmaticlabs/prysm \
    && cd prysm \
    && go install -trimpath -ldflags "-s" ./cmd/beacon-chain

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

EXPOSE 12000/udp 13000

CMD [ "beacon-chain" ]
