#!/bin/bash

# a code archive should already be available

TOP=`pwd`
CODE_ARCHIVE="$1-$2.tar.bz2"
CODE_DIR="$1-$2"
INSTALL_DIR=$TOP
INSTALL_DIR+="/debian/usr"
DEBIAN_CTRL_DIR=$TOP
DEBIAN_CTRL_DIR+="/debian/DEBIAN"

echo "*****************************************"
echo "code archive: $CODE_ARCHIVE"
echo "code directory: $CODE_DIR"
echo "install directory: $INSTALL_DIR"
echo "debian control directory: $DEBIAN_CTRL_DIR"
echo "*****************************************"
tar -xjvf $CODE_ARCHIVE
mkdir -p $INSTALL_DIR
cd $CODE_DIR
./configure --prefix=$INSTALL_DIR
make && make install
cd ..

mv $INSTALL_DIR/share/doc/virtenv/RELNOTES $INSTALL_DIR/share/doc/virtenv/changelog.Debian
gzip -9 $INSTALL_DIR/share/doc/virtenv/changelog.Debian
rm $INSTALL_DIR/share/doc/virtenv/COPYING
cp platform/debian/copyright $INSTALL_DIR/share/doc/virtenv/.
mkdir -p $DEBIAN_CTRL_DIR
sed "s/VIRTVER/$2/g"  platform/debian/control > $DEBIAN_CTRL_DIR/control
find ./debian -type d | xargs chmod 755
dpkg-deb --build debian
lintian debian.deb
mv debian.deb virtenv_$2_1_amd64.ubuntu.deb
rm -fr debian
rm -fr $CODE_DIR






