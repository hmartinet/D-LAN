# -------------------------------------------------
# Project created by QtCreator 2009-10-04T02:24:09
# -------------------------------------------------
QT += testlib
QT -= gui
TARGET = Tests

DESTDIR = "output/debug"
MOC_DIR = ".tmp/debug"
OBJECTS_DIR = ".tmp/debug"

LIBS += -L../output/debug \
   -lLogManager

INCLUDEPATH += . \
   ..
CONFIG += console
CONFIG -= app_bundle
TEMPLATE = app
SOURCES += main.cpp \
    Tests.cpp
HEADERS += Tests.h