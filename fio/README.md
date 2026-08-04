fio
===

Build
-----
cdev env:

    # c -s fio

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-fio
    : ${V:=x.y.x}
    : ${I:=scr.dc.local:5443/is/fio:$V}
    OPTS=(
    --volume $(pwd):/work
    )
    DOCS="
      cd /dir/to/test
      $A -r
    "
