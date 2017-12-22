FROM zcalusic/debian-stretch as builder
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG JIRA_VERSION

ENV JAVA_HOME /usr/java
ENV JIRA_VERSION $JIRA_VERSION
ENV JIRA_INSTALL_DIR /opt/atlassian/jira

RUN mkdir "$JAVA_HOME" \
    && wget --dot-style=mega -O- --header "Cookie: oraclelicense=a" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/server-jre-8u151-linux-x64.tar.gz" | tar xz --strip-components=1 -C "$JAVA_HOME" \
    && mkdir -p "$JIRA_INSTALL_DIR" \
    && wget --dot-style=mega -O- "https://downloads.atlassian.com/software/jira/downloads/atlassian-jira-core-${JIRA_VERSION}.tar.gz" | tar xz --strip-components=1 -C "$JIRA_INSTALL_DIR" \
    && sed -i -e 's/port="8080"/port="8080" secure="${catalinaConnectorSecure}" scheme="${catalinaConnectorScheme}" proxyName="${catalinaConnectorProxyName}" proxyPort="${catalinaConnectorProxyPort}"/' "$JIRA_INSTALL_DIR/conf/server.xml"

FROM zcalusic/debian-stretch
MAINTAINER Zlatko Čalušić <zcalusic@bitsync.net>

ARG URL
ARG VCS_URL
ARG VCS_REF
ARG BUILD_DATE
ARG JIRA_VERSION

LABEL org.label-schema.name="Atlassian JIRA Core in Docker" \
      org.label-schema.description="Run Atlassian JIRA Core project management software in a Docker container" \
      org.label-schema.vendor="Zlatko Čalušić" \
      org.label-schema.license="MIT" \
      org.label-schema.url=$URL \
      org.label-schema.vcs-url=$VCS_URL \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.schema-version="1.0"

ENV JIRA_VERSION $JIRA_VERSION
ENV JIRA_INSTALL_DIR /opt/atlassian/jira
ENV JIRA_HOME /var/atlassian/application-data/jira
ENV JIRA_USER daemon
ENV JIRA_GROUP daemon
ENV JAVA_HOME /usr/java
ENV PATH $JAVA_HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

COPY --from=builder $JAVA_HOME $JAVA_HOME
COPY --from=builder $JIRA_INSTALL_DIR $JIRA_INSTALL_DIR

RUN chown "$JIRA_USER:$JIRA_GROUP" "$JIRA_INSTALL_DIR/conf" "$JIRA_INSTALL_DIR/logs" "$JIRA_INSTALL_DIR/temp" "$JIRA_INSTALL_DIR/work"

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
