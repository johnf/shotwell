#!/bin/sh
set -e

if [ "$1" = 'dpkg-buildpackage' ]; then
    TMP=$(mktemp -d)
    cp -r /mnt/src/ $TMP
    cd $TMP/src
    DEBIAN_FRONTEND=noninteractive mk-build-deps -t "apt-get -o Debug::pkgProblemResolver=yes -y" --install debian/control
    "$@"
    mv $TMP/*.deb /mnt/src/
    exit 0
fi

exec "$@"
