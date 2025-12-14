fdroidserver
============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-fdroidserver
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/fdroidserver:$V}
    OPTS=(
    --volume $(pwd):/var/opt/fdroidserver
    --volume $HOME/.ssh:$HOME/.ssh
    )
