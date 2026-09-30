pandoc
======

Build
-----
cdev env:

    # c -s pandoc

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-pandoc
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/pandoc:$V}
    OPTS=(
    )
