FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN go get github.com/jswank/dnsme

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="DNSME backup in Docker" \
      org.label-schema.description="DNSME backup in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       moreutils \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /go/bin/dnsme /usr/bin/dnsme

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
