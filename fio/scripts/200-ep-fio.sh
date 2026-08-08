#!/bin/bash

[[ -z $FIO_OPTS ]] && FIO_OPTS=""

echo "env config:"
echo "    FIO_OPTS = $FIO_OPTS"
echo

if [ -z "$FIO_OPTS" ]; then
  echo Empty FIO_OPTS - running shell ...
  /bin/bash -l
  exit 0
fi

set -x
fio --version
fio $FIO_OPTS
