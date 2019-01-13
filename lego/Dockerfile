FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG LEGO_VERSION

RUN go get -d github.com/xenolf/lego/cmd/lego \
    && cd src/github.com/xenolf/lego/cmd/lego \
    && git checkout "$LEGO_VERSION" \
    && go install -ldflags "-X main.version=$LEGO_VERSION"

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Lego in Docker" \
      org.label-schema.description="Run Lego in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY --from=builder /go/bin/lego /usr/bin/lego

CMD [ "lego" ]
