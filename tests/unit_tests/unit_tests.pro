QT       += core network testlib

TARGET = tests
TEMPLATE = app

CONFIG += c++11
CONFIG-=app_bundle   

PROJECT_ROOT = $$PWD/../..//
SRC_DIR = $$PROJECT_ROOT/src//

include($$PWD/redisclient-tests.pri)

INCLUDEPATH += \
    $$PWD/

HEADERS  += \
    $$PWD/*.h \
    $$PWD/mocks/*.h

SOURCES += \
    $$PWD/*.cpp \


DEFINES += INTEGRATION_TESTS QT_NO_DEBUG_OUTPUT

LIBS += -L$$PROJECT_ROOT
CONFIG(debug, debug|release) {
    qredisclientshared: {
        unix: LIBS += -lqredisclient_debug
        else: LIBS += qredisclientd0.lib
    } 
    else { 
        unix: LIBS += -lqredisclient
        else: LIBS += qredisclient.lib 
    }
} else {
    qredisclientshared: {
        unix: LIBS += -lqredisclient
        else: LIBS += qredisclient0.lib
    } 
    else { 
        unix: LIBS += -lqredisclient
        else: LIBS += qredisclient.lib 
    }
}

isEmpty(DESTDIR) {
    DESTDIR = $$PWD
}

unix:!mac {
    #code coverage
    QMAKE_CXXFLAGS += -g -fprofile-arcs -ftest-coverage -O0
    QMAKE_LFLAGS += -g -fprofile-arcs -ftest-coverage  -O0
    LIBS += -lgcov
}


OTHER_FILES += \
    connections.xml

RESOURCES += \
    $$PROJECT_ROOT/lua.qrc

UI_DIR = $$DESTDIR/ui
OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
