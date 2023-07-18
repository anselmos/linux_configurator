#!/bin/bash

# Spotify:
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# skype:
wget https://go.skype.com/skypeforlinux-64.deb -O skype.deb
sudo dpkg -i skype.deb

# create opts dir:

mkdir -p ${HOME}/opts/
USER_HOME=${HOME}
# pycharm:

VERSION=2023.1.4
wget https://download.jetbrains.com/python/pycharm-professional-${VERSION}.tar.gz -O ${HOME}/opts/pycharm-professional-${VERSION}.tar.gz
PYCHARM_DIR=${HOME}/opts/pycharm
mkdir -p ${PYCHARM_DIR}
cd ${HOME}/opts && tar -zxvf pycharm-professional-${VERSION}.tar.gz -C ${PYCHARM_DIR} --strip-components=1
rm -rf ${HOME}/opts/pycharm-professional-${VERSION}.tar.gz
sudo ln -s ${USER_HOME}/opts/pycharm/bin/pycharm.sh /usr/bin/pycharm


# phpstorm:
VERSION=2023.1.4
wget https://download.jetbrains.com/webide/PhpStorm-${VERSION}.tar.gz -O ${HOME}/opts/PhpStorm-${VERSION}.tar.gz
PHPSTORM_DIR=${HOME}/opts/phpstorm
mkdir -p ${PHPSTORM_DIR}
cd ${HOME}/opts && tar -zxvf PhpStorm-${VERSION}.tar.gz  -C ${PHPSTORM_DIR} --strip-components=1
rm -rf ${HOME}/opts/PhpStorm-${VERSION}.tar.gz
sudo ln -s ${USER_HOME}/opts/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm


# Postman:
wget https://dl.pstmn.io/download/latest/linux -O ${HOME}/opts/Postman.tar.gz

cd ${HOME}/opts && tar -zxvf Postman.tar.gz 
rm -rf ${HOME}/opts/Postman.tar.gz
sudo ln -s ${USER_HOME}/opts/Postman/Postman /usr/bin/Postman
