FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Journalbeat in Docker" \
      org.label-schema.description="Run Journalbeat in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV JOURNALBEAT_HOME /usr/share/journalbeat
ENV PATH $JOURNALBEAT_HOME/bin:$PATH

COPY elastic.list /etc/apt/sources.list.d/elastic.list

RUN apt-key adv --recv-keys --keyserver hkp://ipv4.pool.sks-keyservers.net D88E42B4 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       journalbeat \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/elastic.list

WORKDIR $JOURNALBEAT_HOME

CMD [ "journalbeat", "-e" ]
