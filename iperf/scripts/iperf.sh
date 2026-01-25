#!/bin/bash

if [ "$1" != "" ]; then
  AL="-c $*"
else
  AL="-c 127.0.0.1"
fi

set -x
iperf3 $AL
