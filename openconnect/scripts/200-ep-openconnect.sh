#!/bin/bash

[[ -z $OPENCONNECT_ID    ]] && OPENCONNECT_ID=""
[[ -z $OPENCONNECT_SHELL ]] && OPENCONNECT_SHELL=/usr/local/etc/openconnect/openconnect${OPENCONNECT_ID:+-}${OPENCONNECT_ID}.sh
[[ -z $OPENCONNECT_PROXY ]] && OPENCONNECT_PROXY=""

if [ "$OPENCONNECT_PROXY" != "" ]; then
  export https_proxy=$OPENCONNECT_PROXY
fi

echo "env config:"
echo "    OPENCONNECT_ID    = $OPENCONNECT_ID"
echo "    OPENCONNECT_SHELL = $OPENCONNECT_SHELL"
echo "    OPENCONNECT_PROXY = $OPENCONNECT_PROXY"
echo "    https_proxy       = $https_proxy"
echo

if [ ! -f $OPENCONNECT_SH ]; then
  echo "E: no shell script: $OPENCONNECT_SH"
  exit 1
fi

set -x
openconnect -V
$OPENCONNECT_SHELL
