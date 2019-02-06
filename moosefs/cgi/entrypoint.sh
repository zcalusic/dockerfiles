#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

: "${TZ:=Etc/UTC}"

# Timezone
echo "$TZ" > /etc/timezone
ln -nsf "/usr/share/zoneinfo/$TZ" /etc/localtime
dpkg-reconfigure tzdata >/dev/null 2>&1

/etc/init.d/fcgiwrap start

exec nginx -g "daemon off;"
