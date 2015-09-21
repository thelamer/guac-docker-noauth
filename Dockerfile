# Dockerfile for guacamole-client
#

# Start from Tomcat image
FROM tomcat:8.0.20-jre7
MAINTAINER Ryan Kuba <ryankuba@gmail.com>

# Version info
ENV \
    GUAC_VERSION=0.9.8

# Add configuration scripts
COPY bin /opt/guacamole/bin/
COPY config /opt/guacamole/config/

# Download and install latest guacamole-client and authentication
RUN /opt/guacamole/bin/download-guacamole.sh "$GUAC_VERSION" /usr/local/tomcat/webapps

# Start Guacamole under Tomcat, listening on 0.0.0.0:8080
EXPOSE 8080
CMD ["/opt/guacamole/bin/start.sh" ]

