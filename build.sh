#!/bin/sh

buildir=/tmp/iosevka-custom-$$

# make temp directory for build
mkdir -p $buildir

# clone iosevka docker container repo
git clone https://github.com/avivace/fonts-iosevka.git $buildir

# build and run docker container
cd $buildir/fonts-iosevka
podman build -t iosevka_build $buildir/fonts-iosevka -f Dockerfile
podman run --rm -it -v $(pwd):/build iosevka_build ttf::iosevka-custom

tar zcvf iosevka-custom-$$.tar.gz dist/iosevka-custom
