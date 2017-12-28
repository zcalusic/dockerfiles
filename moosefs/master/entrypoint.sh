#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ -d "/etc/mfs" ] || exit 1
[ -d "/var/lib/mfs" ] || exit 1

[ -f "/etc/mfs/mfsmaster.cfg" ] || cp -a /etc/mfs.default/mfsmaster.cfg.sample /etc/mfs/mfsmaster.cfg
[ -f "/etc/mfs/mfsexports.cfg" ] || cp -a /etc/mfs.default/mfsexports.cfg.sample /etc/mfs/mfsexports.cfg
[ -f "/etc/mfs/mfstopology.cfg" ] || cp -a /etc/mfs.default/mfstopology.cfg.sample /etc/mfs/mfstopology.cfg
[ -f "/var/lib/mfs/metadata.mfs.empty" ] || cp -a /var/lib/mfs.default/metadata.mfs.empty /var/lib/mfs/metadata.mfs.empty
[ -f "/var/lib/mfs/metadata.mfs" -o -f "/var/lib/mfs/metadata.mfs.back" ] || cp -a /var/lib/mfs/metadata.mfs.empty /var/lib/mfs/metadata.mfs

chown -R "$MOOSEFS_USER:$MOOSEFS_GROUP" /var/lib/mfs

exec mfsmaster -f -a
