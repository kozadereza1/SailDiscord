# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-saildiscord

CONFIG += sailfishapp

#CONFIG += link_pkgconfig
PKGCONFIG += qt5embedwidget

SOURCES += \
    src/harbour-saildiscord.cpp \
    src/settings.cpp

DISTFILES += \
    harbour-saildiscord.desktop \
    qml/components/ServerListItem.qml \
    qml/cover/CoverPage.qml \
    qml/harbour-saildiscord.qml \
    qml/pages/AboutPage.qml \
    qml/pages/ChannelsPage.qml \
    qml/pages/FirstPage.qml \
    qml/pages/LoginDialog.qml \
    qml/pages/SecondPage.qml \
    qml/pages/SettingsPage.qml \
    qml/pages/communicator.py \
    rpm/SailDiscord.changes.in \
    rpm/SailDiscord.changes.run.in \
    rpm/SailDiscord.spec \
    translations/*.ts

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/SailDiscord-de.ts

HEADERS += \
    src/settings.h

# app version
DEFINES += APP_VERSION=\\\"123.0.0\\\"
DEFINES += APP_RELEASE=\\\"$$RELEASE\\\"
