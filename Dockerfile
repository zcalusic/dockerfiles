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

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       git \
       golang-go \
    && export GOPATH=/usr \
    && go get -d github.com/gliderlabs/logspout \
    && go get -d github.com/looplab/logspout-logstash \
    && cd /usr/src/github.com/gliderlabs/logspout \
    && sed -i -e "s/^)$/\t_ \"github.com\/looplab\/logspout-logstash\"\n)/" modules.go \
    && go build -ldflags "-X main.Version=$(cat VERSION)" -o /usr/bin/logspout \
    && cd / \
    && rm -rf /usr/pkg /usr/src/* \
    && apt-get purge -y --auto-remove \
       build-essential \
       git \
       golang-go \
    && rm -rf /var/lib/apt/lists/*

CMD [ "logspout" ]
