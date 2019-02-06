#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ -d "/etc/mfs" ] || exit 1
[ -d "/var/lib/mfs" ] || exit 1

[ -f "/etc/mfs/mfsmetalogger.cfg" ] || cp -a /etc/mfs.default/mfsmetalogger.cfg.sample /etc/mfs/mfsmetalogger.cfg

chown "$MOOSEFS_USER:$MOOSEFS_GROUP" /var/lib/mfs

exec mfsmetalogger -f
