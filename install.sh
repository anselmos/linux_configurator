#!/bin/bash
#author     :anselmos
#version    :0.2.alpha
#usage      :./install.sh

function command_with_echo(){
    command=$1
    echo 'Making command: '$command
    $command
}

function apt_get_install(){
    package_to_install=$1
    command_with_echo 'apt-get install -y '$package_to_install
}

function get_docker_apps(){
    echo "Getting all docker apps with X11 compatibility!"
    docker_keepassx
    docker_chrome
}
function docker_keepassx(){
    docker pull anselmos/keepassx:2.0.alpha2
    wget https://raw.githubusercontent.com/anselmos/docker-keepassx/master/run -O keepassx && chmod +x keepassx && cp keepassx /usr/share/bin
}
function docker_chrome(){
    docker pull c0b0/chrome-stable:52.0.2743.116
    #TODO add run to separated repo.
    echo "docker run \
    -d \
    -e DISPLAY=unix$DISPLAY \
    --privileged \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.keepassx/:/home/developer/data/ \
    c0b0/chrome-stable:52.0.2743.116"> google-chrome
    sudo cp google-chrome /usr/share/bin/

}
function update_release() {
    echo "update_release function"
    command_with_echo 'apt-get update'
}
function install_dependencies(){
    echo "installing dependencies"
    apt_get_install vim
    apt_get_install tmux
    apt_get_install git
    install_docker
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
    get_docker_apps
    clear_apt_get
else
    unmet_release
fi

