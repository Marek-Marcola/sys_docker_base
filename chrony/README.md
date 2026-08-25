chrony
======

Build
-----
cdev env:

    # c -s chrony

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-chrony-dc1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/chrony:$V}
    OPTS=(
    --net host
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN:ro
    --cap-add sys_time
    --env CHRONY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/chrony/$A"
    )
