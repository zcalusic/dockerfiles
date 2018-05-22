FROM alpine:3.7
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="oidentd in Docker" \
      org.label-schema.description="Run oidentd configurable ident server in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN set -x \
    && adduser -S oident \
    && addgroup -S oident \
    && apk add --no-cache oidentd

STOPSIGNAL SIGKILL

EXPOSE 113

CMD [ "/usr/sbin/oidentd", "-i", "-S", "-u", "oident", "-g", "oident" ]
