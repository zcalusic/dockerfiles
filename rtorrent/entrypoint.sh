#! /bin/bash
#
# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${RTORRENT_UID:=1000}"
: "${RTORRENT_GID:=1000}"

groupadd -g $RTORRENT_GID -o rtorrent
useradd -u $RTORRENT_UID -g $RTORRENT_GID -o -d /opt/rtorrent/share -s /usr/sbin/nologin -c rtorrent rtorrent

mkdir -p /run/php
/usr/sbin/php-fpm7.3
/usr/sbin/nginx

cd /opt/rtorrent/share

mv /etc/.rtorrent.rc .
mkdir -p settings torrents users
chown -R rtorrent:rtorrent . /data

chmod 777 /dev/stdout
rm -f session/rtorrent.lock

exec gosu rtorrent:rtorrent rtorrent
