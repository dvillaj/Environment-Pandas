# Dockerfile for working with Jupyter notebooks 
FROM nikolaik/python-nodejs:python3.9-nodejs14-slim

WORKDIR /home/notebooks

COPY requirements.txt /opt/jupyterlab/

RUN apt update && \
    apt install -y git htop vim procps && \
    pip install -U pip && \
    pip install -r /opt/jupyterlab/requirements.txt 

ENV PORT=8888

COPY resources/docker/run-jupyter.sh /opt/jupyterlab

EXPOSE 8888

ENTRYPOINT ["bash", "/opt/jupyterlab/run-jupyter.sh"]