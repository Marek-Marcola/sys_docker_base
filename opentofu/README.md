opentofu
========

Build
-----
cdev env:

    # c -s opentofu

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-opentofu-p513
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/opentofu:$V}
    OPTS=(
    --volume /usr/local/etc/$A:/usr/local/etc/opentofu
    --workdir /usr/local/etc/opentofu
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
