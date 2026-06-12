rocky10
=======

Build
-----
cdev env:

    # c -s rocky10

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-rocky10
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/rocky10:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
    DOCS="
      $A -r
      $A -e cmd
    "
