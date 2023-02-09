#! /bin/bash
#
# Copyright © 2023 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

exec redir -n "$SRC_ADDR" "$DST_ADDR"
