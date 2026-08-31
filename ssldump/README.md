ssldump
=======

Build
-----
cdev env:

    # c -s ssldump

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-ssldump-brext1
    SSLDUMP_OPTS="
    -AHN
    -P
    -i enp6s0
    "

    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/ssldump:$V}
    OPTS=(
    --net host
    --cap-add net_admin,net_raw
    --env SSLDUMP_OPTS="$(echo "$SSLDUMP_OPTS"|grep -v ^#|xargs)"
    )
