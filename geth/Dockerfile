FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG GETH_VERSION

RUN go install -trimpath -ldflags "-s" "github.com/ethereum/go-ethereum/cmd/geth@$GETH_VERSION"

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin

EXPOSE 30303 30303/udp

CMD [ "geth" ]
