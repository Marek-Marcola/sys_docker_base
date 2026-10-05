rust
====

Build
-----
cdev env:

    # c -s rust

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-rust
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/rust:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    )
