fio
===

Build
-----
cdev env:

    # c -s fio

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-fio-v01
    FIO_OPTS="
    --time_based
    --runtime=30s
    --directory=/work
    --filename=fio.bin
    --direct=1
    --bs=1M
    --size=10G
    --iodepth=32
    --group_reporting

    --name=write-$API
    --description=seq_write
    --loops=1
    --numjobs=1
    --rw=write
    --stonewall=1

    --name=read-$API
    --description=seq_read
    --loops=1
    --numjobs=1
    --rw=read
    --stonewall=1
    "

    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/fio:$V}
    OPTS=(
    --volume /vol/$API/tmp:/work
    --env FIO_OPTS="$(echo "$FIO_OPTS"|grep -v ^#)"
    )
    INIT=(
     "install -m 1777 -o root -g root -v -d /vol/$API/tmp"
    )
