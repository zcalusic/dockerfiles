#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

SYNCTHING_CONFIG_FOLDER="${SYNCTHING_HOME}/.config/syncthing"
SYNCTHING_CONFIG_FILE="${SYNCTHING_CONFIG_FOLDER}/config.xml"

if [ ! -f "$SYNCTHING_CONFIG_FILE" ]
then
    syncthing -generate "$SYNCTHING_CONFIG_FOLDER"
    xmlstarlet ed -L -u "/configuration/options/listenAddress" -v "default" "$SYNCTHING_CONFIG_FILE"
    xmlstarlet ed -L -u "/configuration/options/defaultFolderPath" -v "${SYNCTHING_HOME}/Sync" "$SYNCTHING_CONFIG_FILE"
fi

useradd -u "$SYNCTHING_UID" -g "$SYNCTHING_GID" -d "$SYNCTHING_HOME" -s /bin/bash "$SYNCTHING_USER"  || true

chown -R "$SYNCTHING_UID:$SYNCTHING_GID" "$SYNCTHING_HOME"

exec gosu "$SYNCTHING_UID:$SYNCTHING_GID" syncthing -no-browser
