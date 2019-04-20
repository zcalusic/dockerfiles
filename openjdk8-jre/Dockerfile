FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ENV JAVA_HOME /opt/java/openjdk
ENV APR_VERSION 1.7.0
ENV TCNATIVE_VERSION 1.2.21

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       libssl-dev \
       libtool \
    && mkdir -p "$JAVA_HOME" \
    && wget --dot-style=mega -O- "https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=linux&type=jdk&release=latest&heap_size=normal&arch=x64" | tar xz --strip-components=1 -C "$JAVA_HOME" \
    && cd /usr/src \
    && wget --dot-style=mega -O- "https://www-eu.apache.org/dist/apr/apr-${APR_VERSION}.tar.gz" | tar xz \
    && cd "apr-${APR_VERSION}" \
    && ./configure --prefix=/usr \
    && make install \
    && cd /usr/src \
    && wget --dot-style=mega -O- "https://www-eu.apache.org/dist/tomcat/tomcat-connectors/native/$TCNATIVE_VERSION/source/tomcat-native-$TCNATIVE_VERSION-src.tar.gz" | tar xz \
    && cd tomcat-native-$TCNATIVE_VERSION-src/native \
    && ./configure --prefix=/usr \
    && make install

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="OpenJDK 8 HotSpot JRE" \
      org.label-schema.description="OpenJDK 8 HotSpot JRE Docker base image" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV JRE_HOME /opt/java/openjdk
ENV JAVA_TOOL_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap
ENV PATH $JRE_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libasound2 \
       libcups2 \
       libfontconfig1 \
       libxrender1 \
       libxtst6 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$JRE_HOME" \
    && wget --dot-style=mega -O- "https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=linux&type=jre&release=latest&heap_size=normal&arch=x64" | tar xzo --strip-components=1 -C "$JRE_HOME"

COPY --from=builder /usr/lib/libapr-1.so.0.* /usr/lib/
COPY --from=builder /usr/lib/libtcnative-1.so.0.* /usr/lib/

RUN ldconfig \
    && cd /usr/lib \
    && ln -s $(ls libapr-1.so.0.*) /usr/lib/libapr-1.so \
    && ln -s $(ls libtcnative-1.so.0.*) /usr/lib/libtcnative-1.so
