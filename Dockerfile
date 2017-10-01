FROM debian:stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Dropbox in Docker" \
      org.label-schema.description="Run Dropbox Linux client in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       python \
       ca-certificates \
       wget \
    && wget "https://www.dropbox.com/download?dl=packages/dropbox.py" -O /usr/bin/dropbox \
    && chmod 755 /usr/bin/dropbox \
    && mkdir -p /opt/dropbox \
    && wget --dot-style=mega -O- "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzo --strip-components=1 -C /opt/dropbox \
    && ln -s /opt/dropbox/dropboxd /usr/bin \
    && apt-get purge -y --auto-remove \
       ca-certificates \
       wget \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 17500

CMD [ "dropboxd" ]
