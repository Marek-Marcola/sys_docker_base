debian13
========

Build
-----
cdev env:

    # c -s debian13

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-debian13
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/debian13:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    )
    DOCS="
      $A -r
      $A -e cmd
    "

    # cat /usr/local/etc/cman.d/ap-debian13-km
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/debian13:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    --volume /etc/profile.d/zlocal-kman.sh:/etc/profile.d/zlocal-kman.sh:ro
    --volume /usr/local/etc:/usr/local/etc:ro
    --volume /usr/local/bin:/usr/local/bin:ro
    )
    DOCS="
      $A -r
      $A -e id
    "
