#!/bin/bash

[[ -z $FCGIWRAP_PREFORK ]] && FCGIWRAP_PREFORK=5
[[ -z $FCGIWRAP_SOCKET  ]] && FCGIWRAP_SOCKET="tcp:127.0.0.1:9012"

echo "env config:"
echo "    FCGIWRAP_PREFORK = $FCGIWRAP_PREFORK"
echo "    FCGIWRAP_SOCKET  = $FCGIWRAP_SOCKET "
echo

set -x
exec fcgiwrap -s $FCGIWRAP_SOCKET -c $FCGIWRAP_PREFORK
