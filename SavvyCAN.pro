#-------------------------------------------------
#
# Project created by QtCreator 2015-04-25T22:57:44
#
#-------------------------------------------------

QT = core gui printsupport qml serialbus serialport widgets help network opengl

CONFIG(release, debug|release):DEFINES += QT_NO_DEBUG_OUTPUT

CONFIG += c++11
CONFIG += NO_UNIT_TESTS

DEFINES += QCUSTOMPLOT_USE_OPENGL

TARGET = SavvyCAN
TEMPLATE = app

QMAKE_INFO_PLIST = Info.plist.template
ICON = icons/SavvyIcon.icns

SOURCES += \
    src/main.cpp\
    src/connections/lawicel_serial.cpp \
    src/connections/mqtt_bus.cpp \
    src/dbc/dbcnodeduplicateeditor.cpp \
    src/mqtt/qmqtt_client.cpp \
    src/mqtt/qmqtt_client_p.cpp \
    src/mqtt/qmqtt_frame.cpp \
    src/mqtt/qmqtt_message.cpp \
    src/mqtt/qmqtt_network.cpp \
    src/mqtt/qmqtt_router.cpp \
    src/mqtt/qmqtt_routesubscription.cpp \
    src/mqtt/qmqtt_socket.cpp \
    src/mqtt/qmqtt_ssl_socket.cpp \
    src/mqtt/qmqtt_timer.cpp \
    src/mqtt/qmqtt_websocket.cpp \
    src/mqtt/qmqtt_websocketiodevice.cpp \
    src/qcpaxistickerhex.cpp \
    src/re/dbccomparatorwindow.cpp \
    src/mainwindow.cpp \
    src/canframemodel.cpp \
    src/simplecrypt.cpp \
    src/utility.cpp \
    src/qcustomplot.cpp \
    src/frameplaybackwindow.cpp \
    src/candatagrid.cpp \
    src/framesenderwindow.cpp \
    src/framefileio.cpp \
    src/mainsettingsdialog.cpp \
    src/firmwareuploaderwindow.cpp \
    src/scriptingwindow.cpp \
    src/scriptcontainer.cpp \
    src/canfilter.cpp \
    src/can_structs.cpp \
    src/motorcontrollerconfigwindow.cpp \
    src/connections/canconnection.cpp \
    src/connections/serialbusconnection.cpp \
    src/connections/canconfactory.cpp \
    src/connections/gvretserial.cpp \
    src/connections/socketcand.cpp \
    src/connections/canconmanager.cpp \
    src/re/sniffer/snifferitem.cpp \
    src/re/sniffer/sniffermodel.cpp \
    src/re/sniffer/snifferwindow.cpp \
    src/dbc/dbcmessageeditor.cpp \
    src/dbc/dbc_classes.cpp \
    src/dbc/dbchandler.cpp \
    src/dbc/dbcloadsavewindow.cpp \
    src/dbc/dbcmaineditor.cpp \
    src/dbc/dbcnodeeditor.cpp \
    src/dbc/dbcsignaleditor.cpp \
    src/dbc/dbcnoderebaseeditor.cpp \
    src/re/discretestatewindow.cpp \
    src/re/filecomparatorwindow.cpp \
    src/re/flowviewwindow.cpp \
    src/re/frameinfowindow.cpp \
    src/re/fuzzingwindow.cpp \
    src/re/isotp_interpreterwindow.cpp \
    src/re/rangestatewindow.cpp \
    src/re/udsscanwindow.cpp \
    src/connections/canbus.cpp \
    src/connections/canconnectionmodel.cpp \
    src/connections/connectionwindow.cpp \
    src/re/graphingwindow.cpp \
    src/re/newgraphdialog.cpp \
    src/bisectwindow.cpp \
    src/signalviewerwindow.cpp \
    src/bus_protocols/isotp_handler.cpp \
    src/bus_protocols/j1939_handler.cpp \
    src/bus_protocols/uds_handler.cpp \
    src/jsedit.cpp \
    src/frameplaybackobject.cpp \
    src/helpwindow.cpp \
    src/blfhandler.cpp \
    src/re/sniffer/SnifferDelegate.cpp \
    src/connections/newconnectiondialog.cpp \
    src/re/temporalgraphwindow.cpp \
    src/filterutility.cpp \
    src/pcaplite.cpp

HEADERS  += \
    src/mainwindow.h \
    src/can_structs.h \
    src/canframemodel.h \
    src/connections/lawicel_serial.h \
    src/connections/socketcand.h \
    src/connections/mqtt_bus.h \
    src/dbc/dbcnodeduplicateeditor.h \
    src/dbc/dbcnoderebaseeditor.h \
    src/mqtt/qmqtt.h \
    src/mqtt/qmqtt_client.h \
    src/mqtt/qmqtt_client_p.h \
    src/mqtt/qmqtt_frame.h \
    src/mqtt/qmqtt_global.h \
    src/mqtt/qmqtt_message.h \
    src/mqtt/qmqtt_message_p.h \
    src/mqtt/qmqtt_network_p.h \
    src/mqtt/qmqtt_networkinterface.h \
    src/mqtt/qmqtt_routedmessage.h \
    src/mqtt/qmqtt_router.h \
    src/mqtt/qmqtt_routesubscription.h \
    src/mqtt/qmqtt_socket_p.h \
    src/mqtt/qmqtt_socketinterface.h \
    src/mqtt/qmqtt_ssl_socket_p.h \
    src/mqtt/qmqtt_timer_p.h \
    src/mqtt/qmqtt_timerinterface.h \
    src/mqtt/qmqtt_websocket_p.h \
    src/mqtt/qmqtt_websocketiodevice_p.h \
    src/qcpaxistickerhex.h \
    src/re/dbccomparatorwindow.h \
    src/simplecrypt.h \
    src/utility.h \
    src/qcustomplot.h \
    src/frameplaybackwindow.h \
    src/candatagrid.h \
    src/framesenderwindow.h \
    src/can_trigger_structs.h \
    src/framefileio.h \
    src/config.h \
    src/mainsettingsdialog.h \
    src/firmwareuploaderwindow.h \
    src/scriptingwindow.h \
    src/scriptcontainer.h \
    src/canfilter.h \
    src/utils/lfqueue.h \
    src/motorcontrollerconfigwindow.h \
    src/connections/canconnection.h \
    src/connections/serialbusconnection.h \
    src/connections/canconconst.h \
    src/connections/canconfactory.h \
    src/connections/gvretserial.h \
    src/connections/canconmanager.h \
    src/re/sniffer/snifferitem.h \
    src/re/sniffer/sniffermodel.h \
    src/re/sniffer/snifferwindow.h \
    src/dbc/dbc_classes.h \
    src/dbc/dbchandler.h \
    src/dbc/dbcloadsavewindow.h \
    src/dbc/dbcmaineditor.h \
    src/dbc/dbcsignaleditor.h \
    src/dbc/dbcmessageeditor.h \
    src/dbc/dbcnodeeditor.h \
    src/re/discretestatewindow.h \
    src/re/filecomparatorwindow.h \
    src/re/flowviewwindow.h \
    src/re/frameinfowindow.h \
    src/re/fuzzingwindow.h \
    src/re/isotp_interpreterwindow.h \
    src/re/rangestatewindow.h \
    src/re/udsscanwindow.h \
    src/connections/canbus.h \
    src/connections/canconnectionmodel.h \
    src/connections/connectionwindow.h \
    src/re/graphingwindow.h \
    src/re/newgraphdialog.h \
    src/bisectwindow.h \
    src/signalviewerwindow.h \
    src/bus_protocols/isotp_handler.h \
    src/bus_protocols/j1939_handler.h \
    src/bus_protocols/uds_handler.h \
    src/bus_protocols/isotp_message.h \
    src/jsedit.h \
    src/frameplaybackobject.h \
    src/helpwindow.h \
    src/blfhandler.h \
    src/re/sniffer/SnifferDelegate.h \
    src/connections/newconnectiondialog.h \
    src/re/temporalgraphwindow.h \
    src/filterutility.h \
    src/pcaplite.h

FORMS    += ui/candatagrid.ui \
    ui/dbcnodeduplicateeditor.ui \
    ui/dbccomparatorwindow.ui \
    ui/dbcmessageeditor.ui \
    ui/connectionwindow.ui \
    ui/dbcloadsavewindow.ui \
    ui/dbcmaineditor.ui \
    ui/dbcnodeduplicateeditor.ui \
    ui/dbcnoderebaseeditor.ui \
    ui/dbcsignaleditor.ui \
    ui/dbcnodeeditor.ui \
    ui/discretestatewindow.ui \
    ui/filecomparatorwindow.ui \
    ui/firmwareuploaderwindow.ui \
    ui/flowviewwindow.ui \
    ui/frameinfowindow.ui \
    ui/frameplaybackwindow.ui \
    ui/framesenderwindow.ui \
    ui/fuzzingwindow.ui \
    ui/graphingwindow.ui \
    ui/isotp_interpreterwindow.ui \
    ui/mainsettingsdialog.ui \
    ui/mainwindow.ui \
    ui/motorcontrollerconfigwindow.ui \
    ui/newgraphdialog.ui \
    ui/rangestatewindow.ui \
    ui/scriptingwindow.ui \
    ui/snifferwindow.ui \
    ui/udsscanwindow.ui \
    ui/bisectwindow.ui \
    ui/signalviewerwindow.ui \
    helpwindow.ui \
    ui/newconnectiondialog.ui \
    ui/temporalgraphwindow.ui
    
RESOURCES += \
    icons.qrc \
    images.qrc

win32-msvc* {
   LIBS += opengl32.lib
}

win32-g++ {
   LIBS += libopengl32
}

unix {
   isEmpty(PREFIX) {
      PREFIX=/usr/local
   }
   target.path = $$PREFIX/bin
   shortcutfiles.files=SavvyCAN.desktop
   shortcutfiles.path = $$PREFIX/share/applications
   INSTALLS += shortcutfiles
   DISTFILES += SavvyCAN.desktop
}

examplefiles.files=examples
examplefiles.path = $$PREFIX/share/savvycan/examples
INSTALLS += examplefiles

iconfiles.files=icons
iconfiles.path = $$PREFIX/share/icons
INSTALLS += iconfiles

helpfiles.files=help/*
helpfiles.path = $$PREFIX/bin/help
INSTALLS += helpfiles

INSTALLS += target

