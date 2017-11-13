#!/bin/bash

function update_release() {
    echo "update_release function"
}
function install_dependencies(){
    echo "installing dependencies"
}
function unmet_release(){
    echo "This configurator at this point is only valid for Ubuntu linux.\nPlease be adviced, that you use it on your own risk.\nFuture development will add compatibility for other distributions"
}


RELEASE_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [ $RELEASE_NAME="Ubuntu" ]; then
    echo "Starting configuring new linux"
    update_release
    install_dependencies
else
    unmet_release
fi

