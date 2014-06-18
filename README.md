dev.silex.me
============

Virtual Machine to run Silex on a local computer. Intended for developers to contribute easily to Silex.


* Install [Virtualbox](https://www.virtualbox.org/) and [Vagrant](http://www.vagrantup.com/).
* Clone the dev server to your computer using
`$ git clone --recursive git://github.com/silexlabs/silex-dev-server.git`
* Change into the new directory: `cd silex-dev-server`
* If you plan to contribute to Silex, fork [Silex repository](https://github.com/silexlabs/Silex) on github, and clone it on your computer to the folder ```shared/``` of the dev server
`$ git clone --recursive git://github.com/silexlabs/Silex.git shared/Silex`
* Set up the virtual machine with Vagrant: `$ vagrant up` (This step will take some time since it includes downloading a lot.)
* When done, open this url in a browser [dev.silex.me](http://dev.silex.me/) to display your local version of Silex (or [dev.silex.me:6805](http://dev.silex.me:6805/) if port 80 is not available on your computer)

