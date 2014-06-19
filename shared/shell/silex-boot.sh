# silex-boot - Silex server for development
#
# Silex boot script, to watch files and restart Silex server

description "Silex server for development"

start on filesystem or runlevel [2345]
stop on runlevel [!2345]

respawn
respawn limit 10 5
umask 022

# 'sshd -D' leaks stderr and confuses things in conjunction with 'console log'
console none

pre-start script
    echo "define paths"
    SHARED_FOLDER=/home/vagrant/shared
    INITD_FOLDER=/etc/init.d
    # move to Silex directory
    echo "move to Silex directory (${SHARED_FOLDER}/Silex)"
    cd ${SHARED_FOLDER}/Silex
    # defines port for Silex as PORT=80
    echo "defines port for Silex as PORT=80"
    PORT=80
    # build Silex
    echo "build Silex"
    sudo grunt deploy
    # remove previous grunt processes if any
    echo "remove previous grunt processes if any"
    sudo killall -9 grunt
    # start Silex server
    echo "start Silex server"
    sudo grunt watch &
end script
