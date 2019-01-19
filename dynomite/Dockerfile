FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG DYNOMITE_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       automake \
       gcc \
       git \
       libc6-dev \
       libssl1.0-dev \
       libtool \
       make \
    && cd /usr/src \
    && git clone https://github.com/Netflix/dynomite \
    && cd dynomite \
    && git checkout ${DYNOMITE_VERSION} \
    && autoreconf -fvi \
    && ./configure \
    && make -j "$(nproc)" \
    && strip src/dynomite src/dynomite-test src/tools/dynomite-hash-tool

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Dynomite in Docker" \
      org.label-schema.description="Run Dynomite distributed dynamo layer in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       binutils \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /conf

COPY --from=builder /usr/src/dynomite/src/dynomite /usr/sbin/dynomite
COPY --from=builder /usr/src/dynomite/src/dynomite-test /usr/sbin/dynomite-test
COPY --from=builder /usr/src/dynomite/src/tools/dynomite-hash-tool /usr/bin/dynomite-hash-tool
COPY --from=builder /usr/src/dynomite/conf /conf

COPY dynomite.yml /conf/dynomite.yml

STOPSIGNAL SIGKILL

EXPOSE 8101 8102 22222

CMD [ "dynomite" ]
