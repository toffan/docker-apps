#!/bin/sh

BUILD_PACKAGES="wget ca-certificates"
RUNTIME_PACKAGES="libx11-xcb1 libxss1"

PACKAGE="rocketchat_${VERSION}_amd64.deb"
PACKAGE_URL="https://github.com/RocketChat/Rocket.Chat.Electron/releases/download/${VERSION}/${PACKAGE}"

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
