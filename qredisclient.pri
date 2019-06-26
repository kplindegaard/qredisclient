QT += core network

CONFIG += c++11

# If qredisclient configured used/built as shared, declare macro
qredisclientshared:DEFINES += QREDISCLIENT_SHARED

INCLUDEPATH += $$PWD/src

include($$PWD/3rdparty/3rdparty.pri)
