kali
====

Build
-----
cdev env:

    # c -s kali

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-kali
    : ${I:=scr.dc.local:5443/is/kali}
    WDIR=/tmp
    OPTS=(
    --workdir $WDIR
    --net=host
    --pid=host
    --privileged
    --volume /etc/profile.d/zlocal-pman.sh:/etc/profile.d/zlocal-pman.sh:ro
    --volume /usr/local/etc:/usr/local/etc
    --volume /usr/local/bin:/usr/local/bin
    )
