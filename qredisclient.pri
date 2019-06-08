QT += core network

CONFIG += c++11

CONFIG(dll) {
    DEFINES += QREDISCLIENT_SHARED
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

INCLUDEPATH += $$PWD/src/

include($$PWD/3rdparty/3rdparty.pri)

exists($$PWD/src/qredisclient/transporters/ssh/ssh.pri) {
    include($$PWD/src/qredisclient/transporters/ssh/ssh.pri)
}

RESOURCES += \
    $$PWD/lua.qrc
