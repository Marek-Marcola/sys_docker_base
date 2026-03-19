#!/bin/bash

[[ -z $GO2RTC_ID   ]] && GO2RTC_ID=""
[[ -z $GO2RTC_CONF ]] && GO2RTC_CONF=/usr/local/etc/go2rtc/go2rtc${GO2RTC_ID=:+-}${GO2RTC_ID}.yaml

echo "env config:"
echo "    GO2RTC_ID   = $GO2RTC_ID"
echo "    GO2RTC_CONF = $GO2RTC_CONF"
echo

set -x
go2rtc -v
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  go2rtc -c $GO2RTC_CONF
