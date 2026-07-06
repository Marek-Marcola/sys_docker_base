#!/bin/bash

[[ -z $HTTPD_PHP ]] && HTTPD_PHP=0

echo "env config:"
echo "    HTTPD_PHP = $HTTPD_PHP"

if [ "$HTTPD_PHP" = "yes" -o "$HTTPD_PHP" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-php-fpm.conf.disabled /usr/local/etc/supervisord.d/supervisord-php-fpm.conf
  { set +ex; } 2>/dev/null
fi
