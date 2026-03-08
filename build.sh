#!/usr/bin/env bash
set -e
rm -rf build debian/tmp debian/files
docker run --rm -it -v "$PWD:/work" xplayer-builder meson setup build --prefix=/usr
docker run --rm -it -v "$PWD:/work" xplayer-builder meson compile -C build
docker run --rm -it -v "$PWD:/work" xplayer-builder ./build_deb.sh
