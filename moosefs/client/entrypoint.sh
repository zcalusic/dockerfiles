#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ -d "/etc/mfs" ] || exit 1

[ -f "/etc/mfs/mfsmount.cfg" ] || cp -a /etc/mfs.default/mfsmount.cfg.sample /etc/mfs/mfsmount.cfg

exec mfsmount -f
