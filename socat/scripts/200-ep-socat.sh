#!/bin/bash

[[ -z $SOCAT_ID   ]] && SOCAT_ID=""
[[ -z $SOCAT_OPTS ]] && SOCAT_OPTS=""
[[ -z $SOCAT_ADD1 ]] && SOCAT_ADD1=""
[[ -z $SOCAT_ADD2 ]] && SOCAT_ADD2=""

SOCAT_OPTS=$(echo $SOCAT_OPTS|sed 's/,/ /g')

echo "env config:"
echo "    SOCAT_ID   = $SOCAT_ID"
echo "    SOCAT_OPTS = $SOCAT_OPTS"
echo "    SOCAT_ADD1 = $SOCAT_ADD1"
echo "    SOCAT_ADD2 = $SOCAT_ADD2"
echo

set -x
socat -V
exec socat $SOCAT_OPTS $SOCAT_ADD1 $SOCAT_ADD2
