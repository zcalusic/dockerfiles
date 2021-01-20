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
useradd -u $QBITTORRENT_UID -g $QBITTORRENT_GID -o -s /usr/sbin/nologin qbittorrent

chown qbittorrent:qbittorrent /home/qbittorrent

if [ ! -f /home/qbittorrent/.config/qBittorrent/qBittorrent.conf ]
then
    mkdir -p /home/qbittorrent/.config/qBittorrent
    cp /etc/qBittorrent.conf /home/qbittorrent/.config/qBittorrent/qBittorrent.conf
    chown -R qbittorrent:qbittorrent /home/qbittorrent/.config
fi

exec gosu qbittorrent:qbittorrent qbittorrent-nox
