#!/bin/bash

[[ -z $ATFTP_OPTS ]] && ATFTP_OPTS=""

ATFTP_OPTS=$(echo $ATFTP_OPTS|sed 's/__/ /g')

echo "env config:"
echo "    ATFTP_OPTS = $ATFTP_OPTS"
echo

set -x
atftpd --version
exec atftpd --daemon --no-fork --logfile - --user none.none -v $ATFTP_OPTS
