#! /bin/bash
#
# Copyright © 2019 Zlatko Čalušić
#
# Use of this source code is governed by an MIT-style license that can be found in the LICENSE file.
#

set -eu

cd /data
mkdir -p exports records

echo "backup started" | ts

for domain in $(dnsme domains)
do
    echo "exporting $domain records" | ts
    dnsme export "$domain" | jq . > "exports/$domain"
    dnsme records "$domain" > "records/$domain"
done

echo "backup finished" | ts

exit 0
