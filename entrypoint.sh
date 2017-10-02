#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${CATALINA_CONNECTOR_PROXYNAME:=}"
: "${CATALINA_CONNECTOR_PROXYPORT:=}"
: "${CATALINA_CONNECTOR_SCHEME:=http}"
: "${CATALINA_CONNECTOR_SECURE:=false}"
: "${CATALINA_OPTS:=}"

CATALINA_OPTS="$CATALINA_OPTS -DcatalinaConnectorProxyName=$CATALINA_CONNECTOR_PROXYNAME"
CATALINA_OPTS="$CATALINA_OPTS -DcatalinaConnectorProxyPort=$CATALINA_CONNECTOR_PROXYPORT"
CATALINA_OPTS="$CATALINA_OPTS -DcatalinaConnectorScheme=$CATALINA_CONNECTOR_SCHEME"
CATALINA_OPTS="$CATALINA_OPTS -DcatalinaConnectorSecure=$CATALINA_CONNECTOR_SECURE"

export CATALINA_OPTS

chown -R "$JIRA_USER:$JIRA_GROUP" "$JIRA_INSTALL_DIR" "$JIRA_HOME"

exec gosu "$JIRA_USER:$JIRA_GROUP" "$JIRA_INSTALL_DIR/bin/start-jira.sh" -fg
