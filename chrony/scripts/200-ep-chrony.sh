#!/bin/bash

[[ -z $CHRONY_ID   ]] && CHRONY_ID=""
[[ -z $CHRONY_CONF ]] && CHRONY_CONF=/usr/local/etc/chrony/chrony${CHRONY_ID:+-}${CHRONY_ID}.conf

echo "env config:"
echo "    CHRONY_ID   = $CHRONY_ID"
echo "    CHRONY_CONF = $CHRONY_CONF"
echo

if [ ! -f $CHRONY_CONF ]; then
  echo ${0##*/}: error: no config file: $CHRONY_CONF
  exit 1
fi

set -x
chronyd --version
exec chronyd -f $CHRONY_CONF -n -u none
