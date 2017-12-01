#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

[ "$(ls -A /etc/nginx)" ] || cp -a /etc/nginx.default/. /etc/nginx

exec nginx -g "daemon off;"
