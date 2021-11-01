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

    envsubst < $DEPLOY_DIR/services/glances.template  > /etc/systemd/system/glances.service

    systemctl enable glances.service
    systemctl daemon-reload
    systemctl start glances.service
}

function installJupyterLab {
    echo "Installing JupyterLab ..."

    envsubst < $DEPLOY_DIR/services/jupyterlab.template  > /etc/systemd/system/jupyterlab.service

    systemctl enable jupyterlab.service
    systemctl daemon-reload
    systemctl start jupyterlab.service
}