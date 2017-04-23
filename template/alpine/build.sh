#!/bin/sh

BUILD_PACKAGES=""
RUNTIME_PACKAGES=""

pre_install() {
    mkdir -p "$builddir" && cd "$builddir"
    apk add --update --no-cache $BUILD_PACKAGES $RUNTIME_PACKAGES
}

install() {
    :
}

post_install() {
    getent group "$GID" || groupadd -g "$GID" "$USERNAME"
    useradd -ms /bin/nologin -Ng "$GID" -u "$UID" "$USERNAME"
}

clean() {
    apk del --rdepends $BUILD_PACKAGES
    rm -rf /var/cache/apk/*
    cd $OLDPWD && rm -rf /build/
}


set -xe
builddir="${1:-/build}"

pre_install
install
post_install
clean
