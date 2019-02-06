#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ -d "/etc/mfs" ] || exit 1
[ -d "/var/lib/mfs" ] || exit 1

[ -f "/etc/mfs/mfschunkserver.cfg" ] || cp -a /etc/mfs.default/mfschunkserver.cfg.sample /etc/mfs/mfschunkserver.cfg
[ -f "/etc/mfs/mfshdd.cfg" ] || cp -a /etc/mfs.default/mfshdd.cfg.sample /etc/mfs/mfshdd.cfg

chown "$MOOSEFS_USER:$MOOSEFS_GROUP" /var/lib/mfs

exec mfschunkserver -f
