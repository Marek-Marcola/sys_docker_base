#!/bin/bash

[[ -z $SSLDUMP_OPTS ]] && SSLDUMP_OPTS=""

echo "env config:"
echo "    SSLDUMP_OPTS = $SSLDUMP_OPTS"
echo

if [ -z "$SSLDUMP_OPTS" ]; then
  echo Empty SSLDUMP_OPTS - running shell ...
  /bin/bash -l
  exit 0
fi

set -x
ssldump -v
ssldump $SSLDUMP_OPTS
