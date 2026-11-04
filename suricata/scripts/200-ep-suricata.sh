#!/bin/bash

[[ -z $SURICATA_ID   ]] && SURICATA_ID=""
[[ -z $SURICATA_CONF ]] && SURICATA_CONF=/usr/local/etc/suricata/suricata${SURICATA_ID:+-}${SURICATA_ID}.yaml
[[ -z $SURICATA_OPTS ]] && SURICATA_OPTS=""
[[ -z $SURICATA_MODE ]] && SURICATA_MODE="active"

SURICATA_OPTS=$(echo $SURICATA_OPTS|sed 's/__/ /g')

echo "env config:"
echo "    SURICATA_ID   = $SURICATA_ID"
echo "    SURICATA_CONF = $SURICATA_CONF"
echo "    SURICATA_OPTS = $SURICATA_OPTS"
echo "    SURICATA_MODE = $SURICATA_MODE"
echo

if [ "$SURICATA_MODE" = "oos" ]; then
  echo "I: operation mode: out-of-service"
  set -x
  exec -a '[suricata-mode-oos]' sleep 666d
fi

if [ ! -f $SURICATA_CONF ]; then
  echo "E: no config file: $SURICATA_CONF"
  exit 1
fi

set -x
suricata -V
exec suricata -c $SURICATA_CONF $SURICATA_OPTS
