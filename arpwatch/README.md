arpwatch
========

Build
-----
cdev env:

    # c -s arpwatch

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-arpwatch-dc5-brint1
    IF=$(echo $A|awk -F- '{print $NF}')
    FR=arpwatch.$(hostname -s).$IF@dc.local
    TO=sysmon@dc.local

    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/arpwatch:$V}
    OPTS=(
    --net host
    --privileged
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --env ARPWATCH_OPTS=-F__-D__/var/opt/arpwatch__-p__-i__${IF}__-W__${FR}__-w__${TO}__-n__10.5.10.0/24__-n__10.100.0.0/16
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
     "touch /var/opt/$APN/$A/arp.dat"
    )
