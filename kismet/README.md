kismet
======

Build
-----
cdev env:

    # c -s kismet

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-kismet-dc1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/kismet:$V}
    OPTS=(
    --net=host
    --pid=host
    --privileged
    --volume /usr/local/etc/$A:/usr/local/etc/kismet:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/$APN/$A"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/$APN/$A/log"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/$APN/$A/.kismet"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/$APN/$A/.kismet/plugins"
    )
