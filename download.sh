#!/bin/sh

set -eu

TARGETPLATFORM=$1

case $TARGETPLATFORM in
	"linux/arm/v6")
		filename=ArchLinuxARM-rpi-latest.tar.gz
		;;
	"linux/arm/v7")
		filename=ArchLinuxARM-rpi-armv7-latest.tar.gz
		;;
	"linux/arm64")
		filename=ArchLinuxARM-rpi-aarch64-latest.tar.gz
		;;
esac

curl -LO http://os.archlinuxarm.org/os/$filename \
          && mkdir /rootfs \
          && bsdtar -xpf $filename -C /rootfs
