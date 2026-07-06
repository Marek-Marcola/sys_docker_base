#!/bin/bash

[[ -z $HTTPD_ID   ]] && HTTPD_ID=""
[[ -z $HTTPD_CONF ]] && HTTPD_CONF=/usr/local/etc/httpd/httpd${HTTPD_ID:+/}${HTTPD_ID}.conf
[[ -z $HTTPD_MODE ]] && HTTPD_MODE=active

echo "env config:"
echo "    HTTPD_ID   = $HTTPD_ID"
echo "    HTTPD_CONF = $HTTPD_CONF"
echo "    HTTPD_MODE = $HTTPD_MODE"
echo

if [ "$HTTPD_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[httpd-mode-oos]' sleep 666d
fi

if [ ! -f $HTTPD_CONF ]; then
  echo ${0##*/}: error: no config file: $HTTPD_CONF
  exit 1
fi

set -x
umask 002
chmod a+w /dev/std*
httpd -v
httpd -V
exec httpd -f $HTTPD_CONF -DFOREGROUND
