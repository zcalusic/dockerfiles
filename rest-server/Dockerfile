FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Rest Server in Docker" \
      org.label-schema.description="Run Rest Server (development version) in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
    && wget --dot-style=mega -O- https://redirector.gvt1.com/edgedl/go/go1.9.2.linux-amd64.tar.gz | tar xz -C /usr/local  \
    && export PATH="/usr/local/go/bin:$PATH" \
    && export GOPATH=/usr \
    && go get -d github.com/restic/rest-server \
    && cd "$GOPATH/src/github.com/restic/rest-server" \
    && go run build.go \
    && mv rest-server /usr/bin \
    && cd / \
    && rm -rf /usr/pkg /usr/src/* /usr/local/go \
    && apt-get purge -y --auto-remove \
       git \
    && rm -rf /var/lib/apt/lists/*

CMD [ "rest-server" ]
