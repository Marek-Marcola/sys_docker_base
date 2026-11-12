#!/bin/bash

[[ -z $PING_ID    ]] && PING_ID=""
[[ -z $PING_CONF  ]] && PING_CONF=/usr/local/etc/ping/ping${PING_ID:+-}${PING_ID}.env
[[ -z $PING_OPTS  ]] && PING_OPTS="-c 3 -q"
[[ -z $PING_HOSTS ]] && PING_HOSTS="127.0.0.1"
[[ -z $PING_SLEEP ]] && PING_SLEEP=60
[[ -z $PING_LOG   ]] && PING_LOG=/tmp/ping-log

if [ -f "$PING_CONF" ]; then
  source "$PING_CONF"
else
  echo "I: no config file: $PING_CONF"
fi

echo "env config:"
echo "    PING_ID    = $PING_ID"
echo "    PING_CONF  = $PING_CONF"
echo "    PING_OPTS  = $PING_OPTS"
echo "    PING_HOSTS = $PING_HOSTS"
echo "    PING_SLEEP = $PING_SLEEP"
echo "    PING_LOG   = $PING_LOG"

while true; do
  for h in $PING_HOSTS; do
    INFO=$( (set -x; ping $PING_OPTS "$h"; { set +x; } 2>/dev/null) | grep -E 'loss|rtt' )
    INFO=$(echo "$INFO" | xargs)
    echo "$(date +"%y%m%d %H:%M:%S") $h: $INFO" | tee -a "${PING_LOG}-$(date +%y%m%d)"
  done
  sleep "$PING_SLEEP"
done
