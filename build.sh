#!/bin/sh

buildir=$(pwd)/build

# clone iosevka docker container repo
git clone https://github.com/avivace/fonts-iosevka.git $buildir

# build and run docker container
podman build -t iosevka_build $buildir -f Dockerfile
podman run --rm -it -v $(pwd):/build iosevka_build ttf::iosevka-custom

tar zcvf iosevka-custom.tar.gz dist/iosevka-custom
