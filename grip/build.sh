#!/bin/sh

BUILD_PACKAGES="shadow musl-dev gcc python3-dev"
RUNTIME_PACKAGES="python3"

set -xe

mkdir -p /build && cd /build

# Prepare
apk add --update --no-cache $BUILD_PACKAGES $RUNTIME_PACKAGES
pip3 install grip

# groupadd -g "$GID" "$USERNAME"
useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"

# Clean
apk del --rdepends $BUILD_PACKAGES
rm -rf /var/cache/apk/*