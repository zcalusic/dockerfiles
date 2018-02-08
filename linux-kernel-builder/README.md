# Build Linux kernel Debian image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/linux-kernel-builder.svg)](https://hub.docker.com/r/zcalusic/linux-kernel-builder/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/linux-kernel-builder.svg)](https://hub.docker.com/r/zcalusic/linux-kernel-builder/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![License](https://images.microbadger.com/badges/license/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)

Build stable and secure Linux kernel 4.14 Debian image optimized for desktop usage.

## Features

* Virgin Linus source, no patches applied
* Compiled with gcc 7.3, required for protection from Spectre v2 CPU vulnerability (retpoline)
* Configuration based on the official Debian package, with the following improvements:
  * preemptable kernel for better desktop experience
  * 64 bit clean (no support for 32 bit), strangely this keeps CPU almost 10 degrees cooler at idle?!
  * security features against Meltdown/Spectre v2 CPU bugs turned on (PTI/retpoline)
  * better support for laptop touchpads

As of Linux kernel 4.14.18, the situation with CPU bugs is like this (Intel(R) Core(TM) i7-6700K):
```
for file in /sys/devices/system/cpu/vulnerabilities/*
do
    echo -n "$(basename $file): "
    cat $file
done

meltdown: Mitigation: PTI
spectre_v1: Mitigation: __user pointer sanitization
spectre_v2: Mitigation: Full generic retpoline
```

## Usage

```
./linux-kernel-builder 4.14.18
```

After the build finishes, you can find the Debian image in the /tmp/kernel folder.

You can pass your full name & email via `DEBFULLNAME` and `DEBEMAIL` environment variables.
