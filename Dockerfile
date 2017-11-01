FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Gogs in Docker" \
      org.label-schema.description="Run Gogs (development version) in a Docker container" \
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
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/* \
    && wget --dot-style=mega -O- https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz | tar xz -C /usr/local  \
    && export PATH="/usr/local/go/bin:$PATH" \
    && export GOPATH=/usr \
    && export GOBIN="$GOGS_WORK_DIR" \
    && go get -v github.com/gogits/gogs \
    && usermod -d "$GOGS_WORK_DIR" daemon \
    && chown daemon:daemon "$GOGS_WORK_DIR" \
    && cd "$GOPATH/src/github.com/gogits/gogs" \
    && mv conf public templates "$GOGS_WORK_DIR" \
    && rm -rf /usr/pkg /usr/src/* /usr/local/go

EXPOSE 3000

USER daemon

CMD [ "gogs", "web" ]
