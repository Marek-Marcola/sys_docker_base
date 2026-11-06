#!/bin/bash

[[ -z $SHELLCHECK_OPTS ]] && SHELLCHECK_OPTS=""

echo "env config:"
echo "    SHELLCHECK_OPTS = $SHELLCHECK_OPTS"
echo "    CONTAINER_ARGS  = $CONTAINER_ARGS"
echo

set -x
shellcheck --version
{ set +x; } 2>/dev/null

if [ -n "$CONTAINER_ARGS" ]; then
  SF=$CONTAINER_ARGS
else
  SF=$(ls -- *.sh 2>/dev/null)
fi

if [ -n "$SF" ]; then
  for f in $SF; do
    echo
    set -x
    shellcheck $SHELLCHECK_OPTS "$f"
    { set +x; } 2>/dev/null
  done
else
  echo
  echo "I: no shell file(s) found"
fi
