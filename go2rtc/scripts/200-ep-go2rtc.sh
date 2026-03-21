#!/bin/bash

[[ -z $GO2RTC_CONF ]] && GO2RTC_CONF=/usr/local/etc/go2rtc

echo "env config:"
echo "    GO2RTC_CONF = $GO2RTC_CONF"
echo

if [ ! -d "$GO2RTC_CONF" ]; then
  echo ${0##*/}: error: no config directory: $GO2RTC_CONF
  exit 1
fi

set -x
go2rtc -v
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  go2rtc -c $GO2RTC_CONF/go2rtc-local.yaml -c $GO2RTC_CONF/go2rtc.yaml
