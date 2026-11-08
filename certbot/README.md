certbot
=======

Build
-----
cdev env:

    # c -s certbot

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/c-certbot-www
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/certbot:$V}
    OPTS=(
    --volume /usr/local/etc/c-letsencrypt:/etc/letsencrypt
    --volume /var/opt/letsencrypt/c-letsencrypt/lib:/var/lib/letsencrypt
    --volume /var/opt/letsencrypt/c-letsencrypt/log:/var/log/letsencrypt
    --volume /var/opt/nginx/c-nginx-sys/html:/webroot
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/c-letsencrypt"
     "install -m 755 -o root -g root -v -d /var/opt/letsencrypt/c-letsencrypt/lib"
     "install -m 755 -o root -g root -v -d /var/opt/letsencrypt/c-letsencrypt/log"
    )
