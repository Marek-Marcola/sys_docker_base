rsyslog
=======

Build
-----
cdev env:

    # sed -n '/^if.*rsyslog/,/^fi/p' /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-rsyslog-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/rsyslog:$V}
    OPTS=(
    --publish $(ipa bradm1):1514:1514/tcp
    --publish $(ipa bradm1):1514:1514/udp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --env RSYSLOG_OPTS=""
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A"
    )
