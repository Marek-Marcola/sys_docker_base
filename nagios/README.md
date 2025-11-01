nagios
======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-nagios-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/nagios:$V}
    OPTS=(
    --dns $(ipa brsvc1)
    --publish $(ipa brsvc1):8888:8080
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/nagios:ro
    --volume /var/opt/nagios/$A:/var/opt/nagios
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --env NGINX_CGI=1
    --env NGINX_PHP=1
    --env NGINX_ID=ap-nginx-$APN-$API
    --hostname $(hostname -s)
    --privileged
    )
    INIT=(
     "install -m 0755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 0775 -o 477 -g 477 -d /var/opt/nagios/$A"
     "install -m 0775 -o 477 -g 477 -d /var/opt/nagios/$A/archives"
     "install -m 2775 -o 477 -g 477 -d /var/opt/nagios/$A/spool/checkresults"
     "install -m 2775 -o 477 -g 477 -d /var/opt/nagios/$A/rw"
    )
