#-------------------------------------------------
#
# Project created by QtCreator 2016-11-08T15:57:49
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = hello2
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    ../../Qtraspberrylib/mcp23017.cpp \
    expandertest.cpp

HEADERS  += mainwindow.h \
    ../../Qtraspberrylib/mcp23017.h \
    expandertest.h

FORMS    += mainwindow.ui

LIBS += -lwiringPi
