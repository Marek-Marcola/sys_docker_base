#!/bin/bash

[[ -z $CADVISOR_OPTS ]] && CADVISOR_OPTS=""

CADVISOR_OPTS=$(echo $CADVISOR_OPTS|sed 's/__/ /g')

echo "env config:"
echo "    CADVISOR_OPTS = $CADVISOR_OPTS"
echo

set -x
cadvisor -version
exec cadvisor $CADVISOR_OPTS
