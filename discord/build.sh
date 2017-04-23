#!/bin/sh

BUILD_PACKAGES="wget ca-certificates"
RUNTIME_PACKAGES="libxss1"

PACKAGE="discord-canary-${VERSION}.deb"
PACKAGE_URL="https://dl-canary.discordapp.net/apps/linux/${VERSION}/${PACKAGE}"

pre_install() {
    mkdir -p "$builddir" && cd "$builddir"
    apt-get update -y
    apt-get install -y --no-install-recommends $BUILD_PACKAGES $RUNTIME_PACKAGES
}

install() {
    wget -q "$PACKAGE_URL"
    dpkg -i "$PACKAGE" \
        || (apt-get install -fy && dpkg -i "$PACKAGE")
}

post_install() {
    getent group "$GID" || groupadd -g "$GID" "$USERNAME"
    useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"
}

clean() {
    apt-get remove --purge --auto-remove -y $BUILD_PACKAGES
    rm -rf /var/lib/apt/lists/*
    cd $OLDPWD && rm -rf /build/
}


set -xe
builddir="${1:-/build}"

pre_install
install
post_install
clean
