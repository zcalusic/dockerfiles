FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

RUN go install "github.com/restic/rest-server/cmd/rest-server@$REST_SERVER_VERSION"

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

COPY --from=builder /go/bin /usr/bin

EXPOSE 8000

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
