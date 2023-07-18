#!/bin/bash

# Spotify:
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client -y

# skype:
sudo dpkg -i skype.deb

# create opts dir:

mkdir -p $(USER)/opts/
# pycharm:

VERSION=2023.1.4
wget -O https://download.jetbrains.com/python/pycharm-professional-$(VERSION).tar.gz $(USER)/opts/pycharm-professional-$(VERSION).tar.gz
cd $(USER)/opts && tar -zxvf pycharm-professional-$(VERSION).tar.gz 
rm -rf $(USER)/opts/pycharm-professional-$(VERSION).tar.gz
sudo ln -s $(USER)/opts/pycharm-professional-$(VERSION)/pycharm/bin/pycharm.sh /usr/bin/pycharm


# phpstorm:
VERSION=2023.1.4
wget -O https://download.jetbrains.com/webide/PhpStorm-$(VERSION).tar.gz $(USER)/opts/PhpStorm-$(VERSION).tar.gz
cd $(USER)/opts && tar -zxvf PhpStorm-$(VERSION).tar.gz 
rm -rf $(USER)/opts/PhpStorm-$(VERSION).tar.gz
sudo ln -s $(USER)/opts/PhpStorm-$(VERSION)/phpstorm/bin/phpstorm.sh /usr/bin/phpstorm


# Postman:
wget -O https://dl.pstmn.io/download/latest/linux $(USER)/opts/Postman.tar.gz

cd $(USER)/opts && tar -zxvf Postman.tar.gz 
rm -rf $(USER)/opts/Postman.tar.gz
sudo ln -s $(USER)/opts/Postman/Postman /usr/bin/Postman
