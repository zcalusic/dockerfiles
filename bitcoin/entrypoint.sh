#! /bin/bash
#
# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${BITCOIN_UID:=1000}"
: "${BITCOIN_GID:=1000}"

groupadd -g "$BITCOIN_GID" -o bitcoin
useradd -u "$BITCOIN_UID" -g "$BITCOIN_GID" -o -s /usr/sbin/nologin bitcoin

chown bitcoin:bitcoin /home/bitcoin

if [ ! -f /home/bitcoin/.bitcoin/bitcoin.conf ]
then
    cp /etc/bitcoin.conf /home/bitcoin/.bitcoin/bitcoin.conf
    chown bitcoin:bitcoin /home/bitcoin/.bitcoin/bitcoin.conf
fi

exec gosu bitcoin:bitcoin bitcoind
