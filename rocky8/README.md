rocky8
======

Build
-----
cdev env:

    # c -s rocky8

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-rocky8
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/rocky8:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
    DOCS="
      $A -r
      $A -e cmd
    "
