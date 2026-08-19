centos7
=======

Build
-----
cdev env:

    # c -s centos7

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-centos7
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/centos7:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
    DOCS="
      $A -r
      $A -e cmd
    "
