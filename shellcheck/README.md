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
    RUN=1
    QUIET=1
    ASTATS=0
    AHISTORY=0

    # ln -snfvr /usr/local/etc/cman.d/{c-shellcheck,sl}
