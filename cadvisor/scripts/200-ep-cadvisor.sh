#!/bin/bash

[[ -z $CADVISOR_OPTS ]] && CADVISOR_OPTS=""

echo "env config:"
echo "    CADVISOR_OPTS = $CADVISOR_OPTS"
echo

set -x
cadvisor -version
exec cadvisor $CADVISOR_OPTS
