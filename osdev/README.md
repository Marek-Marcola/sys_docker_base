osdev
=====

Build
-----
cdev env:

    # c -s osdev

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-osdev-sync-aosp
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/osdev:$V}
    OPTS=(
    --volume /sw/android/aosp:/sw/android/aosp:rw
    --volume $HOME/.gitconfig:/root/.gitconfig:ro
    --workdir /sw/android/aosp/aosp-mirror
    )

    # cat /usr/local/etc/cman.d/ap-osdev-sync-gos
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/osdev:$V}
    OPTS=(
    --volume /sw/android/aosp:/sw/android/aosp:ro
    --volume /sw/android/gos:/sw/android/gos:rw
    --volume $HOME/.gitconfig:/root/.gitconfig:ro
    --workdir /sw/android/gos/gos-mirror
    )
