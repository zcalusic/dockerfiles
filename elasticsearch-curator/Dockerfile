FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Elasticsearch Curator in Docker" \
      org.label-schema.description="Run Elasticsearch Curator in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

RUN apt-key adv --recv-keys --keyserver hkp://ipv4.pool.sks-keyservers.net D88E42B4 \
    && echo "deb https://packages.elastic.co/curator/5/debian9 stable main" > /etc/apt/sources.list.d/curator.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       elasticsearch-curator \
    && rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/curator.list

CMD [ "curator" ]
