#! /bin/bash
#
# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${QBITTORRENT_UID:=1000}"
: "${QBITTORRENT_GID:=1000}"
: "${EATMYDATA:=no}"

groupadd -g "$QBITTORRENT_GID" -o qbittorrent
useradd -u "$QBITTORRENT_UID" -g "$QBITTORRENT_GID" -o -s /usr/sbin/nologin qbittorrent

chown qbittorrent:qbittorrent /home/qbittorrent

if [ ! -f /home/qbittorrent/.config/qBittorrent/qBittorrent.conf ]
then
    mkdir -p /home/qbittorrent/.config/qBittorrent
    cp /etc/qBittorrent.conf /home/qbittorrent/.config/qBittorrent/qBittorrent.conf
    chown -R qbittorrent:qbittorrent /home/qbittorrent/.config
fi

if [ "$EATMYDATA" = "yes" ]
then
    LD_PRELOAD="/usr/lib/x86_64-linux-gnu/libeatmydata.so"
    export LD_PRELOAD
fi

exec gosu qbittorrent:qbittorrent qbittorrent-nox
