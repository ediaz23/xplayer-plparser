#!/usr/bin/env bash
set -e
rm -rf bin build debian/tmp debian/files
docker run --rm -it -v "$PWD:/work" xplayer-builder meson setup build --prefix=/usr -Denable-gtk-doc=false
docker run --rm -it -v "$PWD:/work" xplayer-builder meson compile -C build
docker run --rm -it -v "$PWD:/work" xplayer-builder ./scripts/build-deb.sh
