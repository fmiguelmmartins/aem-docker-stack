FROM aem-base

#Working directory
WORKDIR /opt/aem

#Arguments to pass to the container
ARG AEM_JVM_OPTS="-XX:+UseParallelGC --add-opens=java.desktop/com.sun.imageio.plugins.jpeg=ALL-UNNAMED --add-opens=java.base/sun.net.www.protocol.jrt=ALL-UNNAMED --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED --add-opens=java.xml/com.sun.org.apache.xerces.internal.dom=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED --add-opens=java.base/java.net=ALL-UNNAMED -Dnashorn.args=--no-deprecation-warning" 
ARG AEM_ENV="dev"
ARG AEM_RUNMODE="-Dsling.run.modes=author"
ARG AEM_JARFILE="aem-quickstart-6.5.0.jar"
ARG AEM_PORT="4502"

# Put in this folder anything you want the author to be bundled with. For instance, I like X-Ray.
ARG PACKAGE_FROM="packages/"

# In case Adobe changes the default package drop location
ARG PACKAGE_TO="./crx-quickstart/install"

#Port
EXPOSE $AEM_PORT

#Environment Variables to be used by launcher script
ENV AEM_JVM_OPTS="${AEM_JVM_OPTS}" \
    AEM_JARFILE="${AEM_JARFILE}" \
    AEM_RUNMODE="${AEM_RUNMODE}" \
    AEM_PORT="${AEM_PORT}" \
    AEM_ENV="${AEM_ENV}"

#Using tini in order to terminate aem gracefully. 
#AEM spawns processes outside the main process and tini takes care of it.
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY scripts/*.sh ./custom_scripts/
RUN chmod +x /opt/aem/custom_scripts/*.sh

# Hot drop AEM packages in the hot drop folder within AEM
COPY $PACKAGE_FROM $PACKAGE_TO

ENTRYPOINT ["/tini", "--","/opt/aem/custom_scripts/aem-start.sh"]