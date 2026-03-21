#!/bin/bash

[[ -z $RTSP2WS_CONF ]] && RTSP2WS_CONF=/usr/local/etc/rtsp2ws/config.json
[[ -z $RTSP2WS_OPTS ]] && RTSP2WS_OPTS="-v1"

echo "env config:"
echo "    RTSP2WS_CONF = $RTSP2WS_CONF"
echo "    RTSP2WS_OPTS = $RTSP2WS_OPTS"
echo

if [ ! -f $RTSP2WS_CONF ]; then
  echo ${0##*/}: error: no config file: $RTSP2WS_CONF
  exit 1
fi

set -x
cd /usr/local/rtsp2ws/share/rtsp2ws
rtsp2ws --version
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  rtsp2ws -C $RTSP2WS_CONF $RTSP2WS_OPTS
