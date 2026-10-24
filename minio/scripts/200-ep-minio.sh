#!/bin/bash

[[ -z $DBCL ]] && DBCL=main
[[ -z $DATA ]] && DATA=/var/opt/minio/$DBCL
[[ -z $USER ]] && USER=admin
[[ -z $PASS ]] && PASS=admin123

echo "env config:"
echo "    DBCL = $DBCL"
echo "    DATA = $DATA"
echo "    USER = $USER"
echo "    PASS = $PASS"
echo

if [ ! -d $DATA ]; then
  echo "E: no data directory: $DATA"
  exit 1
fi

export MINIO_ROOT_USER=$USER
export MINIO_ROOT_PASSWORD=$PASS

set -x
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  minio server $DATA
