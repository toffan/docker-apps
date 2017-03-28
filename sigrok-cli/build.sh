#!/bin/sh

BUILD_PACKAGES="binutils fakeroot gawk gcc git grep gzip make pkg-config sed"
RUNTIME_PACKAGES=""

set -x -e

mkdir -p /build && cd /build

# Prepare
pacman -Sy --noconfirm --noprogressbar $BUILD_PACKAGES $RUNTIME_PACKAGES
git clone https://aur.archlinux.org/sigrok-cli.git
cd sigrok-cli && makepkg -si --noconfirm --noprogressbar

useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"

# Clean
pacman -Rsn --noconfirm $BUILD_PACKAGES
rm -rf /var/cache/pacman/pkg/* /var/lib/pacman/sync
