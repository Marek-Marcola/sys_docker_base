zoneminder
==========

Build
-----
cdev env:

    # c -s zoneminder

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-zoneminder-dc1
    : ${V:=x.y.z-nginx129-php84}
    : ${V:=x.y.z-lighttpd14-php84}
    : ${I:=scr.dc.local:5443/is/zoneminder:$V}
    OPTS=(
    --publish $(ipa brsvc1):8066:8080
    --device /dev/snd
    --device /dev/dri
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --shm-size=8g
    --group-add audio
    --group-add video
    --ulimit nofile=65536:65536
    )
    [[ $OSN =~ debian ]] && OPTS+=(
    --security-opt apparmor=unconfined
    )
    [[ $I =~ nginx ]] && OPTS+=(
    --volume /usr/local/etc/ap-nginx-$APN-$API/php8/php.ini:/usr/local/etc/php8/php.ini
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --env FCGIWRAP_PREFORK=500
    --env NGINX_CGI=1
    --env NGINX_PHP=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    [[ $I =~ lighttpd ]] && OPTS+=(
    --volume /usr/local/etc/ap-lighttpd-$APN-$API:/usr/local/etc/lighttpd:ro
    --volume /usr/local/etc/ap-lighttpd-$APN-$API/php8/php.ini:/usr/local/etc/php8/php.ini
    --volume /var/opt/lighttpd/ap-lighttpd-$APN-$API:/var/opt/lighttpd
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/nginx/ap-nginx-$APN-$API"
     "install -m 755 -o root -g root -v -d /var/opt/lighttpd/ap-lighttpd-$APN-$API"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/cache"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/events"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/export"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/images"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/swap"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/log"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/tmp"
    )
