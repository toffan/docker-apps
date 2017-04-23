#!/bin/sh

BUILD_PACKAGES="shadow musl-dev gcc python3-dev"
RUNTIME_PACKAGES="python3"

pre_install() {
    mkdir -p "$builddir" && cd "$builddir"
    apk add --update --no-cache $BUILD_PACKAGES $RUNTIME_PACKAGES
}

install() {
    pip3 install grip
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
