#!/bin/bash

if [ -f /usr/local/etc/zoneminder/crontab-zoneminder ]; then
  set -x
  crontab -u none /usr/local/etc/zoneminder/crontab-zoneminder
  crontab -u none -l
  { set +ex; } 2>/dev/null
fi
