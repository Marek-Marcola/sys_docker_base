#!/bin/bash

[[ -z $HADOLINT_OPTS ]] && HADOLINT_OPTS=""

echo "env config:"
echo "    HADOLINT_OPTS = $HADOLINT_OPTS"
echo

set -x
hadolint --version
{ set +x; } 2>/dev/null

DF=$(ls Dockerfile* 2>/dev/null)

if [ -n "$DF" ]; then
  for f in $DF; do
    echo
    set -x
    hadolint $HADOLINT_OPTS $f
    { set +x; } 2>/dev/null
  done
else
  echo
  echo "No Dockerfile* files found"
fi
