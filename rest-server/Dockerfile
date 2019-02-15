FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

RUN go get -d github.com/restic/rest-server \
    && cd src/github.com/restic/rest-server \
    && git checkout "$REST_SERVER_VERSION" \
    && go run build.go

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Rest Server in Docker" \
      org.label-schema.description="Run Rest Server in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder /go/src/github.com/restic/rest-server/rest-server /usr/bin/rest-server

CMD [ "rest-server" ]
