TEMPLATE = lib
VERSION = 0.1.0
TARGET = qredisclient


# Handle shared and static builds
CONFIG(qredisclientshared) {
    CONFIG += dll
    CONFIG(debug, debug|release) {
        unix: TARGET = $$join(TARGET,,,_debug)
        else: TARGET = $$join(TARGET,,,d)
    }
} else {
    CONFIG += staticlib
}
QREDISCLIENT_BUILD = 1

include($$PWD/qredisclient.pri)

isEmpty(DESTDIR) {
    DESTDIR = $$PWD
}

HEADERS += \
    $$PWD/src/qredisclient/*.h \
    $$PWD/src/qredisclient/transporters/*.h \
    $$PWD/src/qredisclient/private/*.h \
    $$PWD/src/qredisclient/utils/*.h \

SOURCES += \
    $$PWD/src/qredisclient/*.cpp \
    $$PWD/src/qredisclient/transporters/*.cpp \
    $$PWD/src/qredisclient/private/*.cpp \
    $$PWD/src/qredisclient/utils/*.cpp \

# Embedded 3rdparty dependencies
INCLUDEPATH += 3rdparty
HEADERS += $$PWD/3rdparty/hiredis/read.h \
           $$PWD/3rdparty/hiredis/sds.h
SOURCES += $$PWD/3rdparty/hiredis/read.c \
           $$PWD/3rdparty/hiredis/sds.c


exists($$PWD/src/qredisclient/transporters/ssh/ssh.pri) {
    include($$PWD/src/qredisclient/transporters/ssh/ssh.pri)
}

RESOURCES += \
    $$PWD/lua.qrc

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
