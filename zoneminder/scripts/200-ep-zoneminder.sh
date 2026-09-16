#!/bin/bash

SN="${0##*/}"
ID="[$SN]"

[[ -z $ZONEMINDER_MODE ]] && ZONEMINDER_MODE=active

echo "env config:"
echo "    ZONEMINDER_MODE = $ZONEMINDER_MODE"
echo

if [ "$ZONEMINDER_MODE" = "oos" ]; then
  echo "$ID: I: operation mode: out-of-service"
  set -x
  exec -a '[zoneminder-mode-oos]' sleep 5
else
  set -x
  zmc --version
  zmpkg.pl start
fi

