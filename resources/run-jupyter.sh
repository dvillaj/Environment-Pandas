#!/bin/bash

jupyter lab \
    --NotebookApp.token=$JUPYTERLAB_TOKEN \
    --notebook-dir=/home/notebooks \
    --ip=0.0.0.0  \
    --allow-root \
    --port $PORT \
    --no-browser