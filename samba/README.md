samba
=====

Build
-----
cdev env:

    # c -s samba

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-samba-uran
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/samba:$V}
    OPTS=(
    --network host
    --cap-add CAP_NET_RAW 
    --cap-add CAP_NET_ADMIN 
    --volume /etc/sssd:/etc/sssd:ro
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --volume /sw:/sw
    --volume /nethome:/nethome
    --volume /netdata:/netdata
    --env SAMBA_NMBD=0
    --env SAMBA_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 777 -o root -g root -v -d /var/opt/$APN/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A/private"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A/log"
    )

    # cat /usr/local/etc/cman.d/lssmb
    A=ap-samba-uran
    EXEC=1
    ARGS=lssmb
