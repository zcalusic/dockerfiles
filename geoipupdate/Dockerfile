FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

RUN go get -v github.com/maxmind/geoipupdate2/cmd/geoipupdate

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="GeoIP update in Docker" \
      org.label-schema.description="Run GeoIP update in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder /go/bin/geoipupdate /usr/bin/geoipupdate
COPY GeoIP.conf /etc/GeoIP.conf

CMD [ "geoipupdate", "-f", "/etc/GeoIP.conf" ]
