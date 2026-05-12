node-exporter
=============

Build
-----
cdev env:

    # c -s node-exporter

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-node-exporter
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/node-exporter:$V}
    OPTS=(
    --volume /:/host:ro,rslave
    --net=host
    --pid=host
    --env NODE_EXPORTER_OPTS=--opts.k8s
    )
