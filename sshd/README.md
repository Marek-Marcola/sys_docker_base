sshd
====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-sshd-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local/is/sshd:$V}
    OPTS=(
    --publish 0.0.0.0:22822:22/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/ssh:ro
    --volume /var/opt/sshd/$A/home:/home
    )
