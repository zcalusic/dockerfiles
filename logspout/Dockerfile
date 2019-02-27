FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN go get -d github.com/gliderlabs/logspout \
    && go get -d github.com/looplab/logspout-logstash \
    && cd src/github.com/gliderlabs/logspout \
    && sed -i -e "s/^)$/\t_ \"github.com\/looplab\/logspout-logstash\"\n)/" modules.go \
    && go build -ldflags "-X main.Version=$(cat VERSION)"

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Logspout in Docker" \
      org.label-schema.description="Run Logspout in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder /go/src/github.com/gliderlabs/logspout/logspout /usr/bin/logspout

CMD [ "logspout" ]
