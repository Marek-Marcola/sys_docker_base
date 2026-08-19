#!/bin/bash

[[ -z $HADOLINT_OPTS ]] && HADOLINT_OPTS=""

echo "env config:"
echo "    HADOLINT_OPTS = $HADOLINT_OPTS"
echo

set -x
hadolint --version
hadolint $HADOLINT_OPTS Dockerfile*
