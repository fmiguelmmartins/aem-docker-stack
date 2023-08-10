#!/bin/sh

/usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg

rm -f /run/httpd/authdigest_shm.*
rm -f /run/httpd/cgisock.*
rm -f /run/httpd/httpd.pid
/usr/sbin/httpd -D FOREGROUND