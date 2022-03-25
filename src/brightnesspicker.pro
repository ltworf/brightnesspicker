QT += quick widgets

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
        xrandr.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    brightnesspicker_it_IT.ts
CONFIG += lrelease
CONFIG += embed_translations

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

HEADERS += \
    xrandr.h

target.path = $${DESTDIR}/usr/bin
INSTALLS += target

launcher.files = extras/brightnesspicker.desktop
launcher.path = $${DESTDIR}/usr/share/applications/
INSTALLS += launcher

icon.files = extras/brightnesspicker.svg
icon.path = $${DESTDIR}/usr/share/icons/hicolor/48x48/apps/
INSTALLS += icon

manpage.files = extras/brightnesspicker.1
manpage.path = $${DESTDIR}/usr/share/man/man1/
INSTALLS += manpage
