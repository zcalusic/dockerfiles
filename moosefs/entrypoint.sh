#! /bin/bash
#
# Copyright © 2021 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -e

case $MOOSEFS_START in
    master)
	[ -d "/etc/mfs" ] || exit 1
	[ -f "/etc/mfs/mfsmaster.cfg" ] || cp -a /etc/mfs.default/mfsmaster.cfg.sample /etc/mfs/mfsmaster.cfg
	[ -f "/etc/mfs/mfsexports.cfg" ] || cp -a /etc/mfs.default/mfsexports.cfg.sample /etc/mfs/mfsexports.cfg
	[ -f "/etc/mfs/mfstopology.cfg" ] || cp -a /etc/mfs.default/mfstopology.cfg.sample /etc/mfs/mfstopology.cfg
	[ -f "/etc/mfs/mfsipmap.cfg" ] || cp -a /etc/mfs.default/mfsipmap.cfg.sample /etc/mfs/mfsipmap.cfg

	[ -d "/var/lib/mfs" ] || exit 1
	[ -f "/var/lib/mfs/metadata.mfs.empty" ] || cp -a /var/lib/mfs.default/metadata.mfs.empty /var/lib/mfs/metadata.mfs.empty
	[ -f "/var/lib/mfs/metadata.mfs" ] || [ -f "/var/lib/mfs/metadata.mfs.back" ] || [ -f "/var/lib/mfs/metadata.mfs.back.1" ] || cp -a /var/lib/mfs/metadata.mfs.empty /var/lib/mfs/metadata.mfs
	chown -R daemon:daemon /var/lib/mfs

	CMD="mfsmaster -f -a"
	;;
    metalogger)
	[ -d "/etc/mfs" ] || exit 1
	[ -f "/etc/mfs/mfsmetalogger.cfg" ] || cp -a /etc/mfs.default/mfsmetalogger.cfg.sample /etc/mfs/mfsmetalogger.cfg

	[ -d "/var/lib/mfs" ] || exit 1
	chown -R daemon:daemon /var/lib/mfs

	CMD="mfsmetalogger -f"
	;;
    chunkserver)
	[ -d "/etc/mfs" ] || exit 1
	[ -f "/etc/mfs/mfschunkserver.cfg" ] || cp -a /etc/mfs.default/mfschunkserver.cfg.sample /etc/mfs/mfschunkserver.cfg
	[ -f "/etc/mfs/mfshdd.cfg" ] || cp -a /etc/mfs.default/mfshdd.cfg.sample /etc/mfs/mfshdd.cfg

	[ -d "/var/lib/mfs" ] || exit 1
	chown -R daemon:daemon /var/lib/mfs

	CMD="mfschunkserver -f"
	;;
    client)
	[ -d "/etc/mfs" ] || exit 1
	[ -f "/etc/mfs/mfsmount.cfg" ] || cp -a /etc/mfs.default/mfsmount.cfg.sample /etc/mfs/mfsmount.cfg

	CMD="mfsmount -f"
	;;
    cgi)
	[ -d "/var/lib/mfs" ] || exit 1
	chown -R daemon:daemon /var/lib/mfs

	CMD="mfscgiserv -f"
	;;
    *)
	CMD="sleep infinity"
	;;
esac

# shellcheck disable=SC2086
exec $CMD
