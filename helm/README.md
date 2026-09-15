helm
====

Build
-----
cdev env:

    # c -s helm

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-helm-p513
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/helm:$V}
    OPTS=(
    --volume $HOME/.ssh:$HOME/.ssh
    --volume /usr/local/etc/$A:/usr/local/etc/helm
    --workdir /usr/local/etc/helm
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
