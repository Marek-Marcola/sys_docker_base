#!/bin/bash

[[ -z $HADOLINT_OPTS ]] && HADOLINT_OPTS=""

echo "env config:"
echo "    HADOLINT_OPTS  = $HADOLINT_OPTS"
echo "    CONTAINER_ARGS = $CONTAINER_ARGS"
echo

set -x
hadolint --version
{ set +x; } 2>/dev/null

DF=$(ls Dockerfile* 2>/dev/null)

if [ -n "$CONTAINER_ARGS" ]; then
  set -x
  hadolint $SHELLCHECK_OPTS $CONTAINER_ARGS
  { set +x; } 2>/dev/null
elif [ -n "$DF" ]; then
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
