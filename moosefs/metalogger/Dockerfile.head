FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE
ARG MOOSEFS_VERSION

LABEL org.label-schema.name="MooseFS metalogger server in Docker" \
      org.label-schema.description="Run MooseFS metalogger server in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV MOOSEFS_VERSION $MOOSEFS_VERSION
ENV MOOSEFS_USER daemon
ENV MOOSEFS_GROUP daemon

