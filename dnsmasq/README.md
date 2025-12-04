dnsmasq
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-dnsmasq-int1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/dnsmasq:$V}
    OPTS=(
    --network host
    --volume /usr/local/etc/$A:/usr/local/etc/dnsmasq:ro
    --volume /var/opt/dnsmasq/$A:/var/opt/dnsmasq:rw
    --cap-add net_admin,net_raw
    --env DNSMASQ_CONF=/usr/local/etc/$APN/$APN-$API.conf
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/dnsmasq/$A"
    )
