mediawiki
=========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-mediawiki-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/mediawiki:$V}
    OPTS=(
    --publish $(ipa brsvc1):8041:8080
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --volume /var/opt/sqlite/data/$A:/var/opt/sqlite/data/$A
    --volume /var/opt/nginx/$A:/var/opt/nginx/$A
    --env NGINX_PHP=yes
    --env NGINX_ID=$A
    )
