apt-cacher-ng
=============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-acng-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/acng:$V}
    OPTS=(
    --publish $(ipa brsvc1):3142:3142
    --publish $(ipa brint1):3142:3142
    --volume /usr/local/etc/$A:/usr/local/etc/acng:ro
    --volume /var/opt/acng/$A:/var/opt/acng
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/acng/$A"
     "install -m 755 -o none -g none -v -d /var/opt/acng/$A/cache"
     "install -m 755 -o none -g none -v -d /var/opt/acng/$A/log"
    )
