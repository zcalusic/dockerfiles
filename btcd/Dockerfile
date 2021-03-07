FROM golang:buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN go install github.com/btcsuite/btcd@latest github.com/btcsuite/btcd/cmd/...@latest

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

COPY --from=builder /go/bin /usr/bin
COPY --from=builder /go/pkg/mod/github.com/btcsuite/btcd@v0.21.0-beta/sample-btcd.conf /etc/btcd.conf

EXPOSE 8333 8334

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
