#!/bin/bash

[[ -z $LIGHTTPD_PHP ]] && LIGHTTPD_PHP=0

echo "env config:"
echo "    LIGHTTPD_PHP = $LIGHTTPD_PHP"

if [ "$LIGHTTPD_PHP" = "yes" -o "$LIGHTTPD_PHP" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-php-fpm.conf.disabled /usr/local/etc/supervisord.d/supervisord-php-fpm.conf
  { set +ex; } 2>/dev/null
fi
