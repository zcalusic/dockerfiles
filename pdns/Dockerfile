FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="PowerDNS in Docker" \
      org.label-schema.description="Run PowerDNS Authoritative Server in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

COPY pdns.list /etc/apt/sources.list.d/pdns.list
COPY pdns.pref /etc/apt/preferences.d/pdns/pref

RUN apt-key adv --recv-keys --keyserver hkp://ipv4.pool.sks-keyservers.net FD380FBB \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       pdns-server \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/pdns.list /etc/apt/preferences.d/pdns.pref \
    && sed -i -e 's/^# disable-syslog=no/disable-syslog=yes/' \
       	      -e 's/^setuid=pdns/setuid=daemon/' \
	      -e 's/^setgid=pdns/setgid=daemon/' /etc/powerdns/pdns.conf

STOPSIGNAL SIGKILL

EXPOSE 53 53/udp

CMD [ "pdns_server" ]
