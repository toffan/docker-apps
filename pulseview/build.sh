#!/bin/sh

BUILD_PACKAGES=""
RUNTIME_PACKAGES="ttf-dejavu pulseview"

set -x -e

mkdir -p /build && cd /build

# Prepare
pacman -Sy --noconfirm --noprogressbar $BUILD_PACKAGES $RUNTIME_PACKAGES

useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"

# Clean
# pacman -Rsn --noconfirm $BUILD_PACKAGES
rm -rf /var/cache/pacman/pkg/* /var/lib/pacman/sync
