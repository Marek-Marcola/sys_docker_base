#!/bin/bash

[[ -z $RSYSLOG_ID   ]] && RSYSLOG_ID=""
[[ -z $RSYSLOG_CONF ]] && RSYSLOG_CONF=/usr/local/etc/rsyslog/rsyslog${RSYSLOG_ID:+-}${RSYSLOG_ID}.conf
[[ -z $RSYSLOG_OPTS ]] && RSYSLOG_OPTS=""
[[ -z $RSYSLOG_MODE ]] && RSYSLOG_MODE=active

echo "env config:"
echo "    RSYSLOG_ID   = $RSYSLOG_ID"
echo "    RSYSLOG_CONF = $RSYSLOG_CONF"
echo "    RSYSLOG_OPTS = $RSYSLOG_OPTS"
echo "    RSYSLOG_MODE = $RSYSLOG_MODE"
echo

if [ "$RSYSLOG_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[rsyslog-mode-oos]' sleep 666d
fi

if [ ! -f $RSYSLOG_CONF ]; then
  echo ${0##*/}: error: no config file: $RSYSLOG_CONF
  exit 1
fi

set -x
rsyslogd -v
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  rsyslogd -n -f $RSYSLOG_CONF $RSYSLOG_OPTS
