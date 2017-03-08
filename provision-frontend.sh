#!/bin/bash
echo "Start provisioning!"

echo "add some private repo(nodejs/mongoDB/ruby) to ubuntu"
sudo apt-add-repository ppa:chris-lea/node.js
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
sudo echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

echo "Ubuntu apt-get update"
sudo apt-get update

echo "Ubuntu install basic packages"
sudo apt-get install python-software-properties python g++ make software-properties-common

echo "Installing git"
sudo apt-get install -y git

echo "Installing ruby"
sudo apt-get install -y ruby-full

echo "Installing Sass"
gem install sass

echo "Installing Nginx"
sudo apt-get install -y nginx

echo "Installing MongoDB"
sudo apt-get install -y mongodb-org

echo "Installing Nodejs"
sudo apt-get install -y nodejs

echo "Installing npm"
sudo apt-get install -y npm
sudo chown -R $USER:$GROUP ~/.npm
sudo ln -s /usr/bin/nodejs /usr/bin/node

echo "Installing NRM (globally)"
sudo npm install -g nrm

echo "Swith the npm repository to taobao mirror"
sudo nrm use cnpm

echo "Installing Gulp (globally)"
sudo npm install -g gulp

echo "Installing SailsJs (globally)"
sudo npm install -g sails

echo "Upgrade nodejs to newest stable version"
sudo npm install -g n
sudo n stable

echo "Setting up gitconfig and bash_profile files"
git clone https://github.com/linxiaowu66/PersonalConfigurationFiles.git

cp PersonalConfigurationFiles/.bash_profile .bash_profile
cp PersonalConfigurationFiles/.gitconfig .gitconfig

source .bash_profile
# rm -R dotfiles/

echo "Cleaning the packages"
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

echo "It's all done sweetheart, enjoy! ^.^"
exit
