sonarqube
=========

Build
-----
cdev env:

    # c -s sonarqube

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-sonarqube-dc5
    : ${V:=x.y.z}
    : ${I:=scr.dc.local:5443/is/sonarqube:$V}
    OPTS=(
    --publish 0.0.0.0:9000:9000
    --volume /usr/local/etc/$A:/usr/local/sonarqube/conf
    --volume /var/opt/sonarqube/$A:/var/opt/sonarqube
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/sonarqube/$A"
    )
