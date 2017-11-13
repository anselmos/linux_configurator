#!/bin/bash
#author     :anselmos
#version    :0.2.alpha
#usage      :./install.sh

function update_release() {
    echo "update_release function"
    apt-get update
}
function install_dependencies(){
    echo "installing dependencies"
    apt_get_install vim
    apt_get_install tmux
    apt_get_install git
    install_docker
}
function apt_get_install(){
    package_to_install=$1
    command_with_echo 'apt-get install -y '$package_to_install
}
function command_with_echo(){
    command=$1
    echo 'Making command: '$command
    $command
}
function install_docker(){
    echo "Installing docker!"
    apt_get_install docker.io
    command_with_echo 'sudo usermod -aG docker '$USER
    command_with_echo 'sudo xhost local:'$USER
}

function clear_apt_get(){
    echo "clearing apt-get archives"
    apt-get clean
    apt-get autoclean
}
function unmet_release(){
    echo "This configurator at this point is only valid for Ubuntu linux.\nPlease be adviced, that you use it on your own risk.\nFuture development will add compatibility for other distributions"
}


RELEASE_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [ $RELEASE_NAME="Ubuntu" ]; then
    echo "Starting configuring new linux"
    update_release
    install_dependencies
    clear_apt_get
else
    unmet_release
fi

