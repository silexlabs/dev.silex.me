#!/bin/bash
# define paths
# mesuring time
START=$(date +%s)
echo "start time: $START"
# prevent the warning "stdin: is not a tty"
# https://github.com/mitchellh/vagrant/issues/1673
bash -c 'BASH_ENV=/etc/profile exec bash'
# define paths
echo "define paths"
SHARED_FOLDER=/home/vagrant/shared
INITD_FOLDER=/etc/init
# copy boot script
echo "copy boot script"
sudo cp ${SHARED_FOLDER}/shell/silex-boot.sh ${INITD_FOLDER}/
sudo chmod +x ${INITD_FOLDER}/silex-boot.sh
# install git
echo "install git"
# update apt repo
sudo apt-get update
#sudo apt-get -y upgrade
sudo apt-get -y install git-core
echo "install nodejs"
# install add-apt-repository
#   see http://linuxg.net/how-to-fix-error-sudo-add-apt-repository-command-not-found/
sudo apt-get -y install software-properties-common
sudo apt-get install -y python-software-properties python g++ make
# Modified from https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update

echo "____________________________________"
echo "node version: "
node -v
echo "____________________________________"
sudo apt-get install -y nodejs
echo "____________________________________"
echo "node version: "
node -v
echo "____________________________________"
# upgrade node
#echo "upgrade node"
# prevent "switches character encoding" http://stackoverflow.com/questions/18471764/vagrant-provisioning-switches-character-encoding
#sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
#sudo apt-get upgrade -y nodejs
# install java
sudo apt-get -y  install openjdk-7-jre-headless
# install npm
#echo "install npm"
#curl https://www.npmjs.org/install.sh | sh
#echo "install npm"
#sudo apt-get -y install npm
# prevent the error "failed to fetch from registry: grunt"
# http://stackoverflow.com/questions/12913141/installing-from-npm-fails
npm config set registry http://registry.npmjs.org/
# install grunt
echo "install grunt"
sudo npm install -g grunt
sudo npm install -g grunt-cli
# clone Silex
cd ${SHARED_FOLDER}
if [ ! -d "${SHARED_FOLDER}/Silex" ]; then
  echo "clone Silex in ${SHARED_FOLDER}"
  git clone https://github.com/silexlabs/Silex.git
fi
cd Silex
# update submodules
echo "update submodules"
git submodule update --init --recursive
# install dependencies
echo "install dependencies"
sudo npm install
# start Silex server
#echo "run Silex boot script"
#${INITD_FOLDER}/silex-boot.sh
# mesuring time
END=$(date +%s)
DIFF=$(( $END - $START ))
echo "End time: $END"
echo "Install script duration: $DIFF seconds"
# now reboot in order to start Silex server
echo "now reboot in order to start Silex server"
sudo reboot
