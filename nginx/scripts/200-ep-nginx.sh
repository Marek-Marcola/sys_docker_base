#!/bin/bash

SN="${0##*/}"
ID="[$SN]"

[[ -z $NGINX_ID     ]] && NGINX_ID=""
[[ -z $NGINX_DATA   ]] && NGINX_DATA=/var/opt/nginx${NGINX_ID:+/}${NGINX_ID}
[[ -z $NGINX_GROUPS ]] && NGINX_GROUPS=""
[[ -z $NGINX_MODE   ]] && NGINX_MODE=active
[[ -z $NGINX_INIT   ]] && NGINX_INIT=no

echo "env config:"
echo "    NGINX_ID     = $NGINX_ID"
echo "    NGINX_DATA   = $NGINX_DATA"
echo "    NGINX_GROUPS = $NGINX_GROUPS"
echo "    NGINX_MODE   = $NGINX_MODE"
echo
echo "env config init:"
echo "    NGINX_INIT = $NGINX_INIT"
echo

if [ "$NGINX_MODE" = "oos" ]; then
  echo "$ID: I: operation mode: out-of-service"
  set -x
  exec -a '[nginx-mode-oos]' sleep 666d
fi

if [ "$NGINX_INIT" = "yes" -o "$NGINX_INIT" = "1" ]; then
  if [ ! -d $NGINX_DATA/conf ]; then
    set -x
    mkdir -pv $NGINX_DATA
    cd $NGINX_DATA
    mkdir -v conf html logs temp
    chown none:none logs temp
    cp -rv /usr/local/nginx/conf/* conf
    echo nginx-$INFO_VER/$NGINX_ID > html/index.html
    echo "<?php phpinfo(); ?>" > html/info.php
    { set +ex; } 2>/dev/null
  else
    echo "$ID: W: instance already exists"
  fi
  echo
fi

if [ -n "$NGINX_GROUPS" ]; then
  for g in $(echo $NGINX_GROUPS|sed 's/,/ /g'); do
    GNAME=$(echo $g|awk -F/ '{print $1}')
    GID=$(echo $g|awk -F/ '{print $2}')
    set -x
    groupadd -g $GID $GNAME
    usermod -a -G $GNAME none
    { set +ex; } 2>/dev/null
  done
fi

if [ ! -d $NGINX_DATA ]; then
  echo "$ID: E: no data directory: $NGINX_DATA"
  exit 1
fi

set -x
umask 002
nginx -v
exec nginx -p $NGINX_DATA -g 'daemon off;'
