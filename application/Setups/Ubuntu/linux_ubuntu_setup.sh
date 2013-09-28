#!/bin/bash

DIR=../..
INST_DIR=$DIR/Installations
WORK_DIR=$INST_DIR/packaging
#DEB_DIR=$WORK_DIR/d-lan
#APP_DIR=$DEB_DIR/usr/share/d-lan
#STYLES_DIR=$APP_DIR/styles
#I18N_DIR=$APP_DIR/languages
#DESKTOP_DIR=$DEB_DIR/usr/share/applications
ICON_DIR=$WORK_DIR/icons
ICON_16_DIR=$ICON_DIR/16x16/apps
ICON_24_DIR=$ICON_DIR/24x24/apps
ICON_32_DIR=$ICON_DIR/32x32/apps
ICON_48_DIR=$ICON_DIR/48x48/apps
ICON_64_DIR=$ICON_DIR/64x64/apps
ICON_128_DIR=$ICON_DIR/128x128/apps
ICON_256_DIR=$ICON_DIR/256x256/apps

#STYLES_FILES=$DIR/styles/*
#I18N_FILES=$DIR/translations/*.qm
#CORE_FILE=$DIR/Core/output/release/D-LAN.Core
#GUI_FILE=$DIR/GUI/output/release/D-LAN.GUI
ICON_FILE=$DIR/Common/ressources/icon.ico

# Default dependencies, it may change depending the architecture and the Linux distribution.
DEP_QTCORE=">= 4:4.8"
DEP_QTGUI=">= 4:4.8"
DEP_QTNETWORK=">= 4:4.8"
DEP_PROTOBUF=">= 2.4.1"
DEP_LIBC=">= 2.15"
DEP_LIBSTDCPP=">= 4.6.3"
DEP_LIBGCC=">= 1:4.6.3"

mkdir -p $I18N_DIR $ICON_16_DIR $ICON_24_DIR $ICON_32_DIR $ICON_48_DIR $ICON_64_DIR $ICON_128_DIR $ICON_256_DIR

rm -Rf $WORK_DIR/temp
mkdir -p $WORK_DIR/temp
convert $ICON_FILE $WORK_DIR/temp/icon.png
cp $WORK_DIR/temp/icon-0.png $ICON_16_DIR/d-lan.png
cp $WORK_DIR/temp/icon-1.png $ICON_24_DIR/d-lan.png
cp $WORK_DIR/temp/icon-2.png $ICON_32_DIR/d-lan.png
cp $WORK_DIR/temp/icon-3.png $ICON_48_DIR/d-lan.png
cp $WORK_DIR/temp/icon-4.png $ICON_64_DIR/d-lan.png
cp $WORK_DIR/temp/icon-5.png $ICON_128_DIR/d-lan.png
cp $WORK_DIR/temp/icon-6.png $ICON_256_DIR/d-lan.png

CONTROL="debian/control"
sed -i "s/_DEP_QTCORE_/$DEP_QTCORE/g" $CONTROL
sed -i "s/_DEP_QTGUI_/$DEP_QTGUI/g" $CONTROL
sed -i "s/_DEP_QTNETWORK_/$DEP_QTNETWORK/g" $CONTROL
sed -i "s/_DEP_PROTOBUF_/$DEP_PROTOBUF/g" $CONTROL
sed -i "s/_DEP_LIBC_/$DEP_LIBC/g" $CONTROL
sed -i "s/_DEP_LIBSTDCPP_/$DEP_LIBSTDCPP/g" $CONTROL
sed -i "s/_DEP_LIBGCC_/$DEP_LIBGCC/g" $CONTROL

#version=$($CORE_FILE --version)
#vhead=$(echo $version | cut -d' ' -f 1)
#vtag=$(echo $version | cut -d' ' -f 2)
#vdate=$(echo $version | cut -d' ' -f 3)

#sed -i "s/_VERSION_/$vhead-$vtag/g" $DEB_DIR/DEBIAN/control
$arch=$(arch)
sed -i "s/_ARCH_/$arch/g" $CONTROL
 
rm -Rf $WORK_DIR/temp
