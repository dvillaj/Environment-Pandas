[![Deploy to DockerHub](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-dockerhub.yml/badge.svg)](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-dockerhub.yml)
[![Deploy to DigitalOcean](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-digitalocean.yml/badge.svg)](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-digitalocean.yml)
[![Deploy to Heroku](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-heroku.yml/badge.svg)](https://github.com/dvillaj/Environment-Pandas/actions/workflows/deploy-heroku.yml)

# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab + Git Plugin

All your notebooks will be located in the `notebooks` directory.

## Components

The main components are:

- Python 3.9
- JupyterLab 3 with Git Plugin
- Pandas
- Machine Learning Libraries
- Visualization Libraries 

Feel free to clone this project and use your personal packages

## Flavors

There are several flavors for a local python environment with JupyterLab in your machine:

- [PipEnv](https://pipenv.pypa.io/en/latest/)
- [Conda](https://docs.conda.io/projects/conda/en/latest/index.html)
- [Docker](https://www.docker.com/)

There are another options to have JupyerLab deployed on the cloud:

- [DigitalOcean](https://www.digitalocean.com/)
- [Heroku](https://www.heroku.com/)

**With these cloud options it is important to use the git plugin and save your work in a personal repository**

## PipEnv

This is the simplest option. You only need python installed in your machine and install the `pipenv` package ...

```
pip install pipenv
```

Create a new isolated virtual environment and install all the packages from `requirements.txt` file ...

```
pipenv install -r requirements.txt
```

### JupyterLab with pipenv

Run Jupyter lab

```
pipenv run jupyter lab --notebook-dir ./notebooks
```

### Shortcut in Windows Explorer (Windows Only)

Create a link to launch Jupyter Lab from Windows Explorer:

Click with the left mouse button and set the following properties:
```
Target: C:\Windows\System32\cmd.exe /c "pipenv run jupyter lab --notebook-dir=notebooks"
Start in: [Project's Folder]
```

### Update packages

```
pipenv update
```

### Remove PipEnv Environment

If you don't need the pipenv environment anymore (may be you need free space in your machine) run ...

```
pipenv --rm
```

## Conda

If PipEnv doesn't work (For instance in a new mac with a M1 processor) you have other flavor using conda.

To use conda you need to have a conda client installed. My recommendation is to install in your machine [MiniForge](https://github.com/conda-forge/miniforge) but if you have already installed [Anaconda](https://www.anaconda.com/) in your PC, it is ok.

Conda is similar to PipEnv and will let you create a new isolated virtual environment.

To create a new environment use ...

```
conda create --yes -n environment-pandas python

```

Activate the environment and install all the needed packages from `requirements.txt` file ...

```
conda activate environment-pandas
conda install --yes --file requirements.txt
```

### JupyterLab with Conda

To run JupyterLab ...

```
conda activate environment-pandas
jupyter lab --notebook-dir ./notebooks
```

### Shortcut in Windows Explorer (Windows Only)

Create a link to launch Jupyter Lab from Windows Explorer:

Click with the left mouse button and set the following properties:
```
Target: C:\Windows\System32\cmd.exe /c "conda activate environment-pandas && jupyter lab --notebook-dir ./notebooks"
Start in: [Project's Folder]
```

### Update all packages

```
conda update --all
```

### Remove Conda Environment


If you don't need the conda environment anymore run ...

````
conda env remove -n environment-pandas
````

## Docker

With this option you don't need to have python installed in your local machine. JupyterLab is run thanks to Docker.

I have already created a [Docker image](https://github.com/dvillaj/Docker-JupyterLab-Pandas) for you so you only need to have Docker installed in your machine.

### Execute Docker Image Locally

If you have docker installed in your machine you can run a docker image with the following command and access to [JupyterLab](http://localhost:8888/lab)

```
docker-compose up
```

Press Control-C to exit 


### Deploy Docker Image to DockerHub

This repo contains a GitHub action to publish automatically this image to DockerHub.

To configure this action do:

- Create a new account on [DockerHub](https://hub.docker.com)
- On DockerHub, create a new Access Token (Settings / Security) and copy it
- Edit `.github\workflows\deploy-dockerhub.yml` file to set `DOCKERHUB_USER` and `IMAGE_NAME` variables, with the name account on DockerHub and the image name that will be published on DockerHub
- Add a new repository secret named `DOCKERHUB_TOKEN` with the token from DockerHub


This action will be executed when a new tag named `v*` is pushed to the repository


## Deploy Docker Image to DigitalOcean (Cloud Provider)

This repo contains a GitHub action to have JupyterLab available on the cloud thanks to [DigitalOcean](https://www.digitalocean.com/) and [DuckDns](https://www.duckdns.org/)


**NOTE: This it not FREE and it will cost you about 5$ every month**

To configure this action do:

- Create a new account on [DigitalOcean](https://www.digitalocean.com/), generate a new Token (API menu) and copy it
- Create a new account on [DuckDns](https://www.duckdns.org/), create a new domain and copy the token from the main page.
- Edit `.github\workflows\deploy-digitalocean.yml` file to set `DOCKERHUB_USER` and `IMAGE_NAME` variables, with the name account on DockerHub and the image name that will be deployed in DigitalOcean. These values ​​should be the same as those used in the DockerHub action
- Add a new repository secret named `DIGITALOCEAN_ACCESS_TOKEN` with the token from DigitalOcean
- Add a new repository secret named `DUCKDNS_TOKEN` with the token from DuckDns
- Add a new repository secret named `JUPYTERLAB_TOKEN` with a personal value. This token will be used to access JupyterLab safely. 

This action will do:

- Destroy the previous droplet if exists 
- Create a new 1GB RAM droplet (the cheapest one). This droplet can be power up later.
- Execute the latest JupyterLab image from DockerHub
- Update DuckDNS domain with the Droplet IP

To access to JupyterLab on DigitalOcean use the following url: http://`<duckdns's domain>`.duckdns.org

This action have to be executed manually

NOTE: It's mandatory that the Docker Image with JupyterLab exists in DockerHub so the DockerHub Action have to be executed first.   
**NOTE2: If you execute this action more than one time, the previous droplet in DigitalOcean will be destroyed so your personal notebooks too. Be careful and save your work to a personal github repo first.**


## Deploy Docker Image to Heroku (Cloud Provider)

This repo contains a GitHub action to have JupyterLab available on the cloud thanks to [Heroku](https://www.heroku.com/)

Heroku offers a [FREE plan](https://www.heroku.com/free) with lower resources than DigitalOcean droplet.

To configure this action do:

- Create a new account on [Heroku](https://www.heroku.com/)
- Create a new app and name it
- Generate a Api Key from "Account Settings" option and copy it
- Edit `.github\workflows\deploy-heroku.yml` file to set `HEROKU_EMAIL` and `HEROKU_APP_NAME` variables, with the email used on Heroku and the name of your app
- Add a new repository secret named `HEROKU_API_KEY` with the Api Key from heroku.
- Add a new repository secret named `JUPYTERLAB_TOKEN` with a personal value. This token will be used to access JupyterLab safely. 

This action will build the repo docker image and publish to Heroku's app.

To access to JupyterLab on Heroku access to Heroku's app dashboard and push 'Open app' button.

This action have to be executed manually

**NOTE: Heroku free plan powers off the app after 30 minutes of inactivity, so your notebooks will be lost. Be careful and save your work to a personal github repo.**
