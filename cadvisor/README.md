cadvisor
========

Build
-----
cdev env:

    # sed -n "/^if.*cadvisor/,/^fi/p" /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-cadvisor-dc1
    CADVISOR_OPTS="
    --url_base_prefix=/$API/cadvisor/$(hostname -s)
    --containerd=/tmp/none.sock
    --enable_metrics=cpu,memory,network
    --docker_only=true
    --housekeeping_interval=10s
    --v=1 
    "

    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/cadvisor:$V}
    OPTS=(
    --publish $(ipa brsvc1):8071:8080
    --pid host
    --volume /:/rootfs:ro
    --volume /etc/machine-id:/etc/machine-id:ro
    --volume /run:/run:ro
    --volume /sys:/sys:ro
    --volume /sys/fs/cgroup:/sys/fs/cgroup:ro
    --volume /dev/disk/:/dev/disk:ro
    $(ls -1d /var/lib/docker 2>/dev/null|awk '{printf "--volume %s:%s:ro ",$1,$1}')
    $(ls -1d /var/lib/containers 2>/dev/null|awk '{printf "--volume %s:%s:ro ",$1,$1}')
    --device /dev/kmsg
    --privileged
    --env CADVISOR_OPTS="$(echo $CADVISOR_OPTS)"
    )
