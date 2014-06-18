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
# build Silex
echo "build Silex"
sudo grunt deploy
# remove previous grunt processes if any
echo "remove previous grunt processes if any"
sudo killall -9 grunt
# start Silex server
echo "start Silex server"
sudo grunt watch &

