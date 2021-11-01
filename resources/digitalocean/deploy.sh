#!/bin/bash

function createSwapMemory {
    echo "Creating Swap Memory ..."

    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
}

function installGlances {
    echo "Installing Glances ..."

    apt -qq update
    apt install -y glances

    envsubst < $DEPLOY_DIR/glances.template  > /etc/systemd/system/glances.service

    systemctl enable glances.service
    systemctl daemon-reload
    systemctl start glances.service
}

function installJupyterLab {
    echo "Installing JupyterLab ..."


    envsubst < $ACTUAL_DIR/jupyterlab.template  > /etc/systemd/system/jupyterlab.service

    systemctl enable jupyterlab.service
    systemctl daemon-reload
    systemctl start jupyterlab.service
}


# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

echo "Setting up JupyterLab box ..."

createSwapMemory
installGlances
installJupyterLab

echo "Done :-)"