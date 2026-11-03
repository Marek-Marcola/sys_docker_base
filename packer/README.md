packer
======

Build
-----
cdev env:

    # c -s packer

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-packer-p513
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/packer:$V}
    OPTS=(
    --volume $HOME/.ssh:$HOME/.ssh
    --volume /usr/local/etc/$A:/usr/local/etc/packer
    --workdir /usr/local/etc/packer
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
