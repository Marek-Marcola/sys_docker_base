vdbench
=======

Build
-----
cdev env:

    # c -s vdbench

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-vdbench
    : ${V:=x.y.x}
    : ${I:=scr.dc.local:5443/is/vdbench:$V}
    OPTS=(
    --volume $(pwd):/work
    )
    DOCS="
      cd /dir/to/test
      $A -r
      vdb.sh -w
      vdb.sh -r
    "
