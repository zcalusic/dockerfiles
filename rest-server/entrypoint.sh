#! /bin/bash
#
# Copyright © 2020 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

rest-server --version

if [ -n "$DISABLE_AUTHENTICATION" ]
then
    exec rest-server --no-auth "$@"
else
    exec rest-server "$@"
fi

exit 0
