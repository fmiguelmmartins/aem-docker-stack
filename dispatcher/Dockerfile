FROM centos:7.8.2003

# Install httpd (apache) haproxy and all required programs
RUN yum -y update && \
yum -y install httpd mod_ssl procps haproxy iputils tree telnet less && \
yum clean all

# Remove default CentOS config
RUN rm -rf /etc/httpd/conf/* && \
rm -rf /etc/httpd/conf.d/* && \
rm -rf /etc/httpd/conf.modules.d/*

# Copy the AMS base files into the image.
COPY ams/2.6/etc/httpd /etc/httpd

# Setup sample configs
COPY sample/weretail_filters.any /etc/httpd/conf.dispatcher.d/filters/weretail_filters.any
COPY sample/weretail_publish_farm.any /etc/httpd/conf.dispatcher.d/available_farms/100_weretail_publish_farm.any
COPY sample/weretail.vhost /etc/httpd/conf.d/available_vhosts/

# Copy haproxy config
COPY haproxy/haproxy.cfg /etc/haproxy

# Install dispatcher and setup SSL config for haproxy according to the correct architecture. 
ARG TARGETARCH
COPY scripts/setup.sh /
RUN chmod +x /setup.sh

# Ensuring correct file ending on windows systems
RUN sed -i -e 's/\r\n/\n/' /setup.sh
RUN ./setup.sh
RUN rm /setup.sh

# Prepare haproxy and Apache for being launched
COPY scripts/launch.sh /

# Ensuring correct file ending on windows systems
RUN sed -i -e 's/\r\n/\n/' /launch.sh
RUN chmod +x /launch.sh

EXPOSE  80 443

# Launch haproxy, apache and start the container
ENTRYPOINT ["/bin/bash","/launch.sh"]