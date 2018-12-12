FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG RCLONE_VERSION

RUN go get -d github.com/ncw/rclone \
    && cd src/github.com/ncw/rclone \
    && git checkout "$RCLONE_VERSION" \
    && go install --ldflags "-s -X github.com/ncw/rclone/fs.Version=${RCLONE_VERSION}"

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Rclone in Docker" \
      org.label-schema.description="Run Rclone in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder /go/bin/rclone /usr/bin/rclone

CMD [ "rclone" ]
