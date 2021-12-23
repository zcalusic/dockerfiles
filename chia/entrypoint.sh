#! /bin/bash
#
# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -e

: "${CHIA_UID:=1000}"
: "${CHIA_GID:=1000}"

groupadd -g $CHIA_GID -o chia
useradd -u $CHIA_UID -g $CHIA_GID -o -s /usr/sbin/nologin chia

chown chia:chia /home/chia

if [[ -n $CHIA_START ]]
then
    # shellcheck disable=SC2086
    gosu chia:chia chia start $CHIA_START
fi

trap "gosu chia:chia chia stop all -d; sleep 5; exit 0" SIGTERM

gosu chia:chia sleep infinity

exit 0
