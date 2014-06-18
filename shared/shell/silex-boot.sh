#!/bin/bash
# define paths
echo "define paths"
SHARED_FOLDER=/home/vagrant/shared
INITD_FOLDER=/etc/init.d
# move to Silex directory
echo "move to Silex directory (${SHARED_FOLDER}/Silex)"
cd ${SHARED_FOLDER}/Silex
# defines port for Silex as PORT=80
echo "defines port for Silex as PORT=80"
PORT=80
# start Silex server
echo "start Silex server"
sudo killall -9 grunt
sudo grunt deploy
sudo grunt watch &

