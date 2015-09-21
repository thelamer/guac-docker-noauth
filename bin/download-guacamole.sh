#!/bin/sh -e
#
VERSION="$1"
DESTINATION="$2"

#
# Create destination, if it does not yet exist
#

mkdir -p "$DESTINATION"

#
# Download guacamole.war, placing in specified destination
#

echo "Downloading Guacamole version $VERSION to $DESTINATION ..."
curl -L "http://sourceforge.net/projects/guacamole/files/current/binary/guacamole-${VERSION}.war" > "$DESTINATION/guacamole.war"

