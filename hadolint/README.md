hadolint
========

Build
-----
cdev env:

    # c -s hadolint

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-hadolint
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/hadolint:$V}
    OPTS=(
    --volume $(pwd):/work:ro
    )
