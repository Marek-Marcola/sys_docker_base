#!/bin/bash

[[ -z $HADOLINT_OPTS ]] && HADOLINT_OPTS=""

echo "env config:"
echo "    HADOLINT_OPTS = $HADOLINT_OPTS"
echo

set -x
hadolint --version
{ set +x; } 2>/dev/null

for f in Dockerfile*; do
  echo
  set -x
  hadolint $HADOLINT_OPTS $f
  { set +x; } 2>/dev/null
done
