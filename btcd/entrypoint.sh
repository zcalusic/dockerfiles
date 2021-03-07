#! /bin/bash
#
# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${BTCD_UID:=1000}"
: "${BTCD_GID:=1000}"

groupadd -g $BTCD_GID -o btcd
useradd -u $BTCD_UID -g $BTCD_GID -o -s /usr/sbin/nologin btcd

chown btcd:btcd /home/btcd

if [ ! -f /home/btcd/.btcd/btcd.conf ]
then
    cp /etc/btcd.conf /home/btcd/.btcd/btcd.conf
    chown btcd:btcd /home/btcd/.btcd/btcd.conf
fi

exec gosu btcd:btcd btcd
