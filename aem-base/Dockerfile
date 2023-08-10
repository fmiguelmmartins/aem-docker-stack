# Base Image
FROM amazoncorretto:11

# Description
LABEL os="CentosOS" \
container.description="Centos with tiny" \
image.name="centos-tini"

# Put in this folder anything you want AEM to be bundled with or pass blank to start without anything
ARG PACKAGE_FROM="packages/" 

# In case Adobe changes the default package drop location
ARG PACKAGE_TO="./crx-quickstart/install"

# Filename for the AEM jar file
ARG AEM_FILE="aem-quickstart-6.5.0.jar"

# Filename for AEM license.properties file
ARG AEM_LICENSE="license.properties"

# Working directory
WORKDIR /opt/aem

# Copy base jar and license files into working directory
COPY $AEM_LICENSE .
COPY $AEM_FILE .

# Simply unpack the jar file. No run mode set at this stage
RUN java -jar $AEM_FILE -unpack

# After unpacking, copy all the packages you want your instances to start
COPY $PACKAGE_FROM $PACKAGE_TO