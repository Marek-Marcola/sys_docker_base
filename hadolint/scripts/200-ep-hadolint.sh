#!/bin/bash

[[ -z $HADOLINT_OPTS ]] && HADOLINT_OPTS=""

echo "env config:"
echo "    HADOLINT_OPTS  = $HADOLINT_OPTS"
echo "    CONTAINER_ARGS = $CONTAINER_ARGS"
echo

set -x
hadolint --version
{ set +x; } 2>/dev/null

if [ -n "$CONTAINER_ARGS" ]; then
  DF=$CONTAINER_ARGS
else
  DF=$(ls Dockerfile* 2>/dev/null)
fi

if [ -n "$DF" ]; then
  for f in $DF; do
    echo
    set -x
    hadolint $HADOLINT_OPTS "$f"
    { set +x; } 2>/dev/null
  done
else
  echo
  echo "I: no Dockerfile(s) found"
fi
