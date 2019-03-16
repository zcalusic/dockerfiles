#! /bin/bash
#
# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${QBITTORRENT_UID:=1000}"
: "${QBITTORRENT_GID:=1000}"

groupadd -g $QBITTORRENT_GID -o qbittorrent
useradd -u $QBITTORRENT_UID -g $QBITTORRENT_GID -o -d /home/qbittorrent -s /usr/sbin/nologin -c qBittorrent qbittorrent

cd /home/qbittorrent

[ -f .config/qBittorrent/qBittorrent.conf ] || cp -a /etc/qBittorrent.conf .config/qBittorrent/qBittorrent.conf

chown -R qbittorrent:qbittorrent . /data

exec gosu qbittorrent:qbittorrent qbittorrent-nox
