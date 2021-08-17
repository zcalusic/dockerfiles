FROM golang:bullseye as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

RUN go get -d github.com/restic/rest-server \
    && cd "pkg/mod/github.com/restic/rest-server@$REST_SERVER_VERSION" \
    && go get -u \
    && go mod tidy \
    && go run build.go

FROM zcalusic/debian-bullseye
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

COPY --from=builder "/go/pkg/mod/github.com/restic/rest-server@$REST_SERVER_VERSION/rest-server" /usr/bin

EXPOSE 8000

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
