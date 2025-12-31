netxms-server
=============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-netxms-server-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/netxms-server:$V}
    OPTS=(
    --publish $(ipa brsvc1):4701:4701/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/netxms:ro
    --volume /var/opt/netxms/$A:/var/opt/netxms:rw
    --cap-add=CAP_NET_RAW
    --hostname nms
    --ip=10.88.88.10
    --mac-address=52:54:00:01:ba:ca
    --env NETXMS_INIT=sqlite
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/netxms/$A"
     "install -m 755 -o 486 -g 486 -v -d /var/opt/netxms/$A/server"
     "install -m 755 -o 486 -g 486 -v -d /var/opt/netxms/$A/sqlite"
    )
