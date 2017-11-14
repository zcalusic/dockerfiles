FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV REDIS_VERSION 4.0.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       libc6-dev \
       make \
    && mkdir /usr/src/redis \
    && cd /usr/src/redis \
    && wget -O- "http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz" | tar xz --strip-components=1 \
    && make -j "$(nproc)" install \
    && strip /usr/local/bin/*

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Redis in Docker" \
      org.label-schema.description="Run Redis persistent key-value database in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV REDIS_USER daemon
ENV REDIS_GROUP daemon

COPY --from=builder /usr/local/bin /usr/bin

RUN mkdir /config.default

COPY --from=builder /usr/src/redis/redis.conf /config.default/redis.conf

WORKDIR /data

EXPOSE 6379

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
