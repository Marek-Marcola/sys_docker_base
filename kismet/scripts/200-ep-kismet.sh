#!/bin/bash

[[ -z $KISMET_CONF   ]] && KISMET_CONF=/usr/local/etc/kismet/kismet_site.conf

echo "env config:"
echo "    KISMET_CONF = $KISMET_CONF"
echo

if [ ! -f $KISMET_CONF ]; then
  echo "E: no config file: $KISMET_CONF"
  exit 1
fi

set -x
exec setpriv --reuid=0 --regid=0 --groups=0 \
  kismet --homedir /var/opt/kismet --log-prefix /var/opt/kismet/log
