#!/usr/bin/env bash
# Generate the 'ts' files the compile them to 'qm' files
#set -o errexit

LANGS="fr"
TS_DIR=translations
QM_DIR=languages

cd $TS_DIR

# We should use the project files, but there is a bug described here: https://bugreports.qt-project.org/browse/QTBUG-24587
# lupdate Core.pro
# lupdate GUI.pro

for Lang in $LANGS
do
   TS_FILES_GUI="$TS_FILES_GUI d_lan_gui.$Lang.ts"
   TS_FILES_CORE="$TS_FILES_CORE d_lan_core.$Lang.ts"
done

lupdate-qt4 -no-ui-lines -codecfortr UTF-8 ../GUI ../Common/RemoteCoreController -ts $TS_FILES_GUI
lupdate-qt4 -no-ui-lines -codecfortr UTF-8 ../Core -ts $TS_FILES_CORE

for SubSystem in GUI Core
do
   mkdir -p ../$SubSystem/output/debug/$QM_DIR
done

rm *.qm

lrelease-qt4 *.ts

cp *gui*.qm ../GUI/output/debug/$QM_DIR
cp *core*.qm ../Core/output/debug/$QM_DIR
