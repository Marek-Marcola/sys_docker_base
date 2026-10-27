icc
===

Build
-----
cdev env:

    # c -s icc

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-icc
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/icc:$V}
