DISP_ID=docker
## Replace value with the Author IP and Port you are using:
AUTHOR_IP=192.168.10.15
AUTHOR_PORT=4502
AUTHOR_DEFAULT_HOSTNAME=author.docker.local
AUTHOR_DOCROOT=/mnt/var/www/author
## Replace value with the Publisher IP and Port you are using:
PUBLISH_IP=192.168.10.15
PUBLISH_PORT=4503
PUBLISH_DEFAULT_HOSTNAME=publish.docker.local
PUBLISH_DOCROOT=/mnt/var/www/html
## Replace value with the LiveCycle IP and Port you are using:
#LIVECYCLE_IP=127.0.0.1
#LIVECYCLE_PORT=8080
#LIVECYCLE_DEFAULT_HOSTNAME=aemforms-exampleco-dev.adobecqms.net
#LIVECYCLE_DOCROOT=/mnt/var/www/lc

PUBLISH_FORCE_SSL=0
AUTHOR_FORCE_SSL=0

## Enable / Disable CRXDE access.  Production this should be disabled
#CRX_FILTER=allow
CRX_FILTER=deny

## Allow dispatcher flush from any IP
## WARNING: Set this to "allowed" on local dev environments that don't have fixed IPs
## Set to deny or comment out on prod environments
DISPATCHER_FLUSH_FROM_ANYWHERE=allow

ENV_TYPE=dev
RUNMODE=sites
