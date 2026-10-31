#!/bin/bash

if [ -d /var/opt/mediawiki/extensions ]; then
  pushd /var/opt/mediawiki/extensions
  ls | \
  while read d; do
    if [ ! -d /usr/local/mediawiki/extensions/$d ]; then
      set -x
      ln -snfv /var/opt/mediawiki/extensions/$d /usr/local/mediawiki/extensions
      { set +ex; } 2>/dev/null
    fi
  done
  popd
fi
