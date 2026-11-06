hadolint
========

Build
-----
cdev env:

    # c -s hadolint

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/c-hadolint
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/hadolint:$V}
    OPTS=(
    --volume $(pwd):/work:ro
    )
    RUN=1
    _EXEC=1
    QUIET=1
    ASTATS=0
    AHISTORY=0

    # ln -snfvr /usr/local/etc/cman.d/{c-hadolint,dl}
