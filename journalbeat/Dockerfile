FROM golang:stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG JOURNALBEAT_VERSION

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libsystemd-dev \
    && go get -d github.com/mheese/journalbeat \
    && cd src/github.com/mheese/journalbeat \
    && git checkout "$JOURNALBEAT_VERSION" \
    && go install -v

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

COPY --from=builder /go/bin/journalbeat $JOURNALBEAT_HOME/bin/journalbeat
COPY journalbeat.yml $JOURNALBEAT_HOME/journalbeat.yml

WORKDIR $JOURNALBEAT_HOME

RUN mkdir data logs

CMD [ "journalbeat", "-e" ]
