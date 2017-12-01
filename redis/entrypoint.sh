#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ "$(ls -A /config)" ] || cp -a /config.default/redis.conf /config/redis.conf

chown -R "$REDIS_USER:$REDIS_GROUP" /data

exec gosu "$REDIS_USER:$REDIS_GROUP" redis-server /config/redis.conf "$@"
