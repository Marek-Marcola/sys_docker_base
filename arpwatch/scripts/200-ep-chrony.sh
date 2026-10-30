#!/bin/bash

[[ -z $ARPWATCH_OPTS ]] && ARPWATCH_OPTS=""

ARPWATCH_OPTS=$(echo $ARPWATCH_OPTS|sed 's/__/ /g')

echo "env config:"
echo "    ARPWATCH_OPTS = $ARPWATCH_OPTS"
echo

set -x
exec arpwatch $ARPWATCH_OPTS
