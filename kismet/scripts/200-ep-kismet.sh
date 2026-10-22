#!/bin/bash

[[ -z $KISMET_CONF ]] && KISMET_CONF=/usr/local/etc/kismet/kismet_site.conf
[[ -z $KISMET_DATA ]] && KISMET_HOME=/var/opt/kismet

echo "env config:"
echo "    KISMET_CONF = $KISMET_CONF"
echo "    KISMET_HOME = $KISMET_HOME"
echo

if [ ! -f $KISMET_CONF ]; then
  echo "E: no config file: $KISMET_CONF"
  exit 1
fi

set -x
exec setpriv --reuid=0 --regid=0 --groups=0 \
  kismet --homedir $KISMET_HOME --log-prefix $KISMET_HOME/log
