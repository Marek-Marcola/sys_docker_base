#!/bin/bash

[[ -z $MEDIAMTX_ID   ]] && MEDIAMTX_ID=""
[[ -z $MEDIAMTX_CONF ]] && MEDIAMTX_CONF=/usr/local/etc/mediamtx/mediamtx${MEDIAMTX_ID:+-}$MEDIAMTX_ID.yml

echo "env config:"
echo "    MEDIAMTX_ID   = $MEDIAMTX_ID"
echo "    MEDIAMTX_CONF = $MEDIAMTX_CONF"
echo

if [ ! -f $MEDIAMTX_CONF ]; then
  echo ${0##*/}: error: no config file: $MEDIAMTX_CONF
  exit 1
fi

if [ -n "$(ls /dev/video* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/video*
  { set +ex; } 2>/dev/null
fi

if [ -n "$(ls /dev/media* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/media*
  { set +ex; } 2>/dev/null
fi

if [ -n "$(ls /dev/dri/* 2>/dev/null)" ]; then
  set -x
  chmod -v a+rw /dev/dri/*
  { set +ex; } 2>/dev/null
fi

set -x
mediamtx --version
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  mediamtx $MEDIAMTX_CONF
