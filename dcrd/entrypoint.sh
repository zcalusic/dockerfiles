#! /bin/bash
#
# Copyright © 2022 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${DCRD_UID:=1000}"
: "${DCRD_GID:=1000}"

groupadd -g $DCRD_GID -o dcrd
useradd -u $DCRD_UID -g $DCRD_GID -o -s /usr/sbin/nologin dcrd

chown dcrd:dcrd /home/dcrd

exec gosu dcrd:dcrd dcrd
