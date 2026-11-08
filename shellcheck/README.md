shellcheck
==========

Build
-----
cdev env:

    # c -s shellcheck

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/c-shellcheck
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/shellcheck:$V}
    OPTS=(
    --volume $(pwd):/work:ro
    )

    # cat /usr/local/etc/cman.d/sl
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/shellcheck:$V}
    OPTS=(
    --volume $(pwd):/work:ro
    )
    RUN=1
    _EXEC=1
    QUIET=1
    ASTATS=0
    AHISTORY=0
