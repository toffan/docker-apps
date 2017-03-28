#!/bin/sh

BUILD_PACKAGES="patch"

set -x -e

mkdir -p /build && cd /build

# Prepare
pacman -Sy --noconfirm --noprogressbar $BUILD_PACKAGES
patch /usr/bin/makepkg makepkg.patch

# Clean
pacman -Rsn --noconfirm $BUILD_PACKAGES
rm -rf /var/cache/pacman/pkg/* /var/lib/pacman/sync
