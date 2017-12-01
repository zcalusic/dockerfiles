#! /bin/bash
#
# Copyright © 2017 Zlatko Čalušić
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
release="rest-server-${version}"
bin="/go/bin"
src="/go/src"

wget -q "https://github.com/restic/rest-server/archive/v${version}.tar.gz" -O "${bin}/${release}.tar.gz"

cd $src
tar xf "${bin}/${release}.tar.gz"
cd "$release"

# https://golang.org/doc/install/source#environment

for osarch in \
	darwin/386 \
	darwin/amd64 \
	dragonfly/amd64 \
	freebsd/386 \
	freebsd/amd64 \
	freebsd/arm \
	linux/386 \
	linux/amd64 \
	linux/arm \
	linux/arm64 \
	linux/ppc64 \
	linux/ppc64le \
	linux/mips \
	linux/mipsle \
	linux/mips64 \
	linux/mips64le \
	netbsd/386 \
	netbsd/amd64 \
	netbsd/arm \
	openbsd/386 \
	openbsd/amd64 \
	openbsd/arm \
	plan9/386 \
	plan9/amd64 \
	solaris/amd64 \
	windows/386 \
	windows/amd64
do
    os=$(dirname $osarch)
    arch=$(basename $osarch)
    filename=${release}-${os}-${arch}

    if [[ "$os" == "windows" ]]
    then
        filename="${filename}.exe"
    fi

    echo "$filename"

    go run build.go --goos "$os" --goarch "$arch" --output "$filename"

    if [[ "$os" == "windows" ]]
    then
        zip -q9 "${filename%.exe}.zip" "$filename"
        rm "$filename"
        mv "${filename%.exe}.zip" /go/bin
    else
        gzip -q9 "$filename"
	chmod 644 "${filename}.gz"
        mv "${filename}.gz" /go/bin
    fi
done

cd $bin
sha256sum rest-server-*.{gz,zip} "${release}.tar.gz" > sha256sums.txt

exit 0
