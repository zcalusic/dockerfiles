#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ -d "/var/lib/mfs" ] || exit 1

chown -R "$MOOSEFS_USER:$MOOSEFS_GROUP" /var/lib/mfs

exec mfscgiserv -f
