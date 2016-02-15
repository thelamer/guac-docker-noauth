#!/bin/sh -e

GUACAMOLE_HOME="$HOME/.guacamole"
GUACAMOLE_EXT="$GUACAMOLE_HOME/extensions"
GUACAMOLE_PROPERTIES="$GUACAMOLE_HOME/guacamole.properties"
GUACAMOLE_NOAUTH="$GUACAMOLE_HOME/noauth-config.xml"

mkdir -p $GUACAMOLE_HOME
mkdir -p $GUACAMOLE_EXT

wget -O "$GUACAMOLE_EXT"/guacamole-auth-noauth-"$GUAC_VERSION".jar http://ryankuba.com/DropBox/guacamole-auth-noauth-"$GUAC_VERSION".jar

# Insert Config Files

sed -e "s/GAUCD_SERVER/$GAUCD_SERVER/g" -e "s/GAUCD_PORT/$GAUCD_PORT/g" -e "s,GUACAMOLE_HOME,$GUACAMOLE_HOME,g" /opt/guacamole/config/guacamole.properties > $GUACAMOLE_PROPERTIES

sed -e "s/VNC_SERVER/$VNC_SERVER/g" -e "s/VNC_PORT/$VNC_PORT/g" -e "s/VNC_PASSWORD/$VNC_PASSWORD/g" /opt/guacamole/config/noauth-config.xml > $GUACAMOLE_NOAUTH

sed -e "s/GUAC_VERSION/$GUAC_VERSION/g" /opt/guacamole/config/gauc-manifest.json > $GUACAMOLE_EXT/gauc-manifest.json

start_guacamole() {
    cd /usr/local/tomcat
    exec catalina.sh run
}

start_guacamole
