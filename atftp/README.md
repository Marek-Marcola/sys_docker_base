atftp
=====

Build
-----
cdev env:

    # c -s atftp

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-atftp-int1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/atftp:$V}
    OPTS=(
    --network host
    --volume /netboot:/netboot:ro
    --volume /netroot:/netroot:ro
    --cap-add net_admin,net_raw
    --env ATFTP_OPTS=--no-multicast__/netboot
    )
