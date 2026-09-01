fdroidserver
============

Build
-----
cdev env:

    # c -s fdroidserver

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-fdroidserver-dc1
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/fdroidserver:$V}
    WDIR=/var/opt/fdroidserver/$A
    OPTS=(
    --volume $WDIR:/var/opt/fdroidserver
    --volume $HOME/.ssh:$HOME/.ssh
    )
    DOCS="
      $A -r
      lsfdroid -l -v
      lsfdroid -u -v
      lsfdroid -d -v
    "
