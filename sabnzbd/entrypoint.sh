#! /bin/bash
#
# Copyright © 2020 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${SABNZBD_UID:=1000}"
: "${SABNZBD_GID:=1000}"
: "${SABNZBD_SERVER:=0.0.0.0:8080}"

groupadd -g $SABNZBD_GID -o sabnzbd
useradd -u $SABNZBD_UID -g $SABNZBD_GID -o -s /usr/sbin/nologin sabnzbd

chown sabnzbd:sabnzbd /home/sabnzbd

export PYTHONIOENCODING=utf-8

exec gosu sabnzbd:sabnzbd /opt/sabnzbd/SABnzbd.py --server $SABNZBD_SERVER --browser 0
