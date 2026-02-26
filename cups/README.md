cups
====

Build
-----
cdev env:

    # sed -n '/^if.*cups/,/^fi/p' /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-cups-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/cups:$V}
    OPTS=(
    --publish $(ipa brsvc1  ):631:631/tcp
    --publish $(ipa brint1:1):631:631/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/opt/$APN
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
     "install -m 777 -o root -g root -v -d /var/opt/$APN/$A/tmp"
    )
