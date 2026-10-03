#!/bin/bash

[[ -z $OPA_OPTS ]] && OPA_OPTS=""

OPA_OPTS=$(echo $OPA_OPTS|sed 's/__/ /g')

echo "env config:"
echo "    OPA_OPTS = $OPA_OPTS"
echo

set -x
opa version
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  opa run --server $OPA_OPTS
