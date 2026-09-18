helm
====

Build
-----
cdev env:

    # c -s helm

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-helm-a111
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/helm:$V}
    OPTS=(
    --volume /usr/local/etc/hman.d:/usr/local/etc/hman.d
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
