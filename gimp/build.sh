#!/bin/sh

BUILD_PACKAGES="shadow"
RUNTIME_PACKAGES="dbus-x11 ttf-dejavu numix-themes-gtk2 gimp"

set -x -e

mkdir -p /build && cd /build

# Prepare
apk add --update --no-cache $BUILD_PACKAGES $RUNTIME_PACKAGES

useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"

# Clean
apk del --rdepends $BUILD_PACKAGES
rm -rf /var/cache/apk/*
