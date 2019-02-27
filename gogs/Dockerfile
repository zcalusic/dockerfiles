FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG GOGS_VERSION

RUN go get -d github.com/gogs/gogs \
    && cd src/github.com/gogs/gogs \
    && git checkout "$GOGS_VERSION" \
    && go install

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Gogs in Docker" \
      org.label-schema.description="Run Gogs in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV GOGS_WORK_DIR /opt/gogs
ENV PATH $GOGS_WORK_DIR:$PATH
ENV USER daemon

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$GOGS_WORK_DIR" "$GOGS_WORK_DIR/conf" "$GOGS_WORK_DIR/public" "$GOGS_WORK_DIR/templates" \
    && chown daemon:daemon "$GOGS_WORK_DIR" \
    && usermod -d "$GOGS_WORK_DIR" daemon

COPY --from=builder /go/bin/gogs $GOGS_WORK_DIR
COPY --from=builder /go/src/github.com/gogs/gogs/conf $GOGS_WORK_DIR/conf
COPY --from=builder /go/src/github.com/gogs/gogs/public $GOGS_WORK_DIR/public
COPY --from=builder /go/src/github.com/gogs/gogs/templates $GOGS_WORK_DIR/templates

EXPOSE 3000

USER daemon

CMD [ "gogs", "web" ]
