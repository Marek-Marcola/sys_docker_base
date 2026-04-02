mediamtx
========

Build
-----
cdev env:

    # c -s mediamtx

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-mediamtx-p111
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/mediamtx:$V}
    OPTS=(
    --publish $(ipa brsvc1):7554:7554/tcp
    --publish $(ipa brint1):7554:7554/tcp
    --device /dev/snd
    --device /dev/dri
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
