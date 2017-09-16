FROM zcalusic/oracle-java8
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE

LABEL org.label-schema.name="Atlassian Bamboo in Docker" \
      org.label-schema.description="Run Atlassian Bamboo CI, deployment and release management software in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ARG BAMBOO_VERSION=6.1.1

ENV RUN_USER daemon
ENV RUN_GROUP daemon

ENV BAMBOO_HOME /var/atlassian/application-data/bamboo
ENV BAMBOO_INSTALL_DIR /opt/atlassian/bamboo

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    git \
    openssh-client \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$BAMBOO_INSTALL_DIR" \
    && wget --dot-style=mega -O- "https://downloads.atlassian.com/software/bamboo/downloads/atlassian-bamboo-${BAMBOO_VERSION}.tar.gz" | tar xz --strip-components=1 -C "$BAMBOO_INSTALL_DIR" \
    && sed -i -e 's/port="8085"/port="8085" secure="${catalinaConnectorSecure}" scheme="${catalinaConnectorScheme}" proxyName="${catalinaConnectorProxyName}" proxyPort="${catalinaConnectorProxyPort}"/' "$BAMBOO_INSTALL_DIR/conf/server.xml"

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
