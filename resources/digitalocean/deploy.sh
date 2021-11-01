#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

echo "Setting up JupyterLab box ..."

source $DEPLOY_DIR/functions.sh

createSwapMemory
installGlances
installJupyterLab

echo "Done :-)"