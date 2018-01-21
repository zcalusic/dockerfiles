#! /bin/bash
#
# Copyright © 2018 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -e

if [[ "$#" != 1 ]]
then
    echo "Usage: build.sh <version>" >&2
    exit 1
fi

version="$1"

cd /tmp/kernel
rm -rf "linux-$version"

if [ "${version/rc}" = "$version" ]
then
    wget -O- "https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-$version.tar.xz" | tar xJo
else
    wget -O- "https://git.kernel.org/torvalds/t/linux-$version.tar.gz" | tar xzo
fi

(
    cd "linux-$version"
    cp /tmp/config .config
    cp /tmp/builddeb scripts/package/builddeb
    make oldconfig
    make -j "$(nproc)" bindeb-pkg EXTRAVERSION="-1-amd64"
)

rm -rf "linux-$version"

exit 0
