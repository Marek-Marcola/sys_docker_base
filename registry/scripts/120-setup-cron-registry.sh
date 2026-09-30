#!/bin/bash

if [ -f /usr/local/etc/registry/crontab-registry ]; then
  set -x
  crontab -u none /usr/local/etc/registry/crontab-registry
  crontab -u none -l
  { set +ex; } 2>/dev/null
fi
