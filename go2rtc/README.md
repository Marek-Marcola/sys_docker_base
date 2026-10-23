go2rtc
======

Build
-----
cdev env:

    # c -s

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-go2rtc-dc1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/go2rtc:$V}
    OPTS=(
    --publish $(ipa brsvc1):1984:1984/tcp
    --publish $(ipa brsvc1):8554:8554/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
