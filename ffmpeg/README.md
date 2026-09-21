ffmpeg
======

Build
-----
cdev env:

    # c -s ffmpeg

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-ffmpeg
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/ffmpeg:$V}
    WDIR=/tmp
    OPTS=(
    --volume $HOME:$HOME
    --workdir $HOME
    )
