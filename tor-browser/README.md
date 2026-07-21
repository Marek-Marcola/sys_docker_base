tor-browser
===========

Build
-----
cdev env:

    # c -s tor-browser

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-tor-browser
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/tor-browser:$V}
    OPTS=(
    --net host
    --volume /tmp/.X11-unix/:/tmp/.X11-unix/
    --volume /run/user/$(id -u $USER):/run/user/$(id -u $USER)
    --volume /run/dbus/system_bus_socket:/run/dbus/system_bus_socket
    --volume /etc/passwd:/etc/passwd:ro
    --user 666:666
    --group-add audio
    --group-add video
    --workdir /usr/local/tor-browser
    --env HOME=/tmp
    --env DISPLAY=$DISPLAY
    --env PULSE_SERVER=unix:/run/user/$(id -u $USER)/pulse/native
    )
