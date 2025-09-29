haproxy
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-haproxy-www
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/haproxy:$V}
    OPTS=(
    --publish $(ipa brext1:orion):80:8080/tcp
    --publish $(ipa brext1:orion):443:8443/tcp
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/haproxy:ro
    --env HAPROXY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
