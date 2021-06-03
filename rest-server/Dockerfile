FROM golang:buster as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG REST_SERVER_VERSION

RUN go get -d github.com/restic/rest-server \
    && cd "pkg/mod/github.com/restic/rest-server@$REST_SERVER_VERSION" \
    && go get -u \
    && go mod tidy \
    && go run build.go

FROM zcalusic/debian-buster
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE
ARG REST_SERVER_VERSION

LABEL org.label-schema.name="Rest Server in Docker" \
      org.label-schema.description="Run Rest Server in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder "/go/pkg/mod/github.com/restic/rest-server@$REST_SERVER_VERSION/rest-server" /usr/bin

EXPOSE 8000

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
