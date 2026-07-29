ssh
===

Build
-----
cdev env:

    # c -s ssh

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-ssh-dc1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/ssh:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
