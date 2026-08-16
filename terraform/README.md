terraform
=========

Build
-----
cdev env:

    # c -s terraform

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-terraform-p513
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/terraform:$V}
    OPTS=(
    --volume $HOME/.ssh:$HOME/.ssh
    --volume $HOME/.terraformrc:$HOME/.terraformrc
    --volume /usr/local/etc/$A:/usr/local/etc/terraform
    --workdir /usr/local/etc/terraform
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
