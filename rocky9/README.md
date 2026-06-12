rocky9
======

Build
-----
cdev env:

    # c -s rocky9

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-rocky9
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/rocky9:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
    DOCS="
      $A -r
      $A -e cmd
    "
