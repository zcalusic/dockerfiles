# Build Linux kernel Debian image

[![Pulls](https://img.shields.io/docker/pulls/zcalusic/linux-kernel-builder.svg)](https://hub.docker.com/r/zcalusic/linux-kernel-builder/)
[![Stars](https://img.shields.io/docker/stars/zcalusic/linux-kernel-builder.svg)](https://hub.docker.com/r/zcalusic/linux-kernel-builder/)
[![Image](https://images.microbadger.com/badges/image/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![Version](https://images.microbadger.com/badges/version/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![Commit](https://images.microbadger.com/badges/commit/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)
[![License](https://images.microbadger.com/badges/license/zcalusic/linux-kernel-builder.svg)](https://microbadger.com/images/zcalusic/linux-kernel-builder/)

Build stable and secure Linux kernel 4.14 Debian image optimized for desktop usage.

## Features

* Compiled with gcc 8.2
* Configuration based on the official Debian package, with the following improvements:
  * preemptable kernel for better desktop experience
  * 64 bit clean (no support for 32 bit)
  * better support for laptop touchpads

## Usage

```
./linux-kernel-builder 4.14.59
```

After the build finishes, you can find the Debian image in the /tmp/kernel folder.

You can pass your full name & email via `DEBFULLNAME` and `DEBEMAIL` environment variables.
