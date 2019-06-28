QT += core network

CONFIG += c++11

CONFIG(qredisclientshared) {
    equals(QREDISCLIENT_BUILD, 1) {
        DEFINES += "QREDISCLIENT_EXPORT=Q_DECL_EXPORT"
    } else {
        DEFINES += "QREDISCLIENT_EXPORT=Q_DECL_IMPORT"
    }
} else {
    DEFINES += "QREDISCLIENT_EXPORT="
}

INCLUDEPATH += $$PWD/src

include($$PWD/3rdparty/3rdparty.pri)
