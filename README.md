# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab + Git Plugin

All your notebooks will be located in the `notebooks` directory.

## Flavors

There are several flavors for a local python environment with JupyterLab in your machine:

- [PipEnv](https://pipenv.pypa.io/en/latest/)
- [Conda](https://docs.conda.io/projects/conda/en/latest/index.html)
- [Docker](https://www.docker.com/)

There is another option to have JupyerLab deployed on the cloud:

- [DigitalOcean](https://www.digitalocean.com/)

## PipEnv

This is the simplest option. You only need python installed in your machine and install the `pipenv` package ...

```
pip install pipenv
```

Create a new isolated virtual environment and install all the packages from `requeriments.txt` file ...

```
pipenv install -r requeriments.txt
```

### JupyterLab with pipenv

Run Jupyter lab

```
pipenv run jupyter lab --notebook-dir ./notebooks
```

### Shotcut in Windows Exporer (Windows Only)

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

### Remove PipEnv Enrironment

If you don't neeed the pipenv environment anymore (may be you need free space in your machine) run ...

```
pipenv --rm
```

## Conda

If PipEnv doesn't work (For instance in a new mac with a M1 procesor) you have other flavor using conda.

To use conda you need to have a conda client installed. My recommendation is to install in your machine [MiniForge](https://github.com/conda-forge/miniforge) but if you have already installed [Anaconda](https://www.anaconda.com/) in your PC, it is ok.

Conda is similar to PipEnv and will let you create a new isolated virtual environment.

To create a new environment use ...

```
conda create --yes -n environment-pandas python

```

Activate the environment and install all the needed packages from `requeriments.txt` file ...

```
conda activate environment-pandas
conda install --yes --file requeriments.txt
```

### JupyterLab with Conda

To run JupyterLab ...

```
conda activate environment-pandas
jupyter lab --notebook-dir ./notebooks
```

### Shotcut in Windows Exporer (Windows Only)

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


If you don't neeed the conda environment anymore run ...

````
conda env remove -n environment-pandas
````

## Docker

With this option you don't need to have python installed in your local machine. JupyterLab is run thanks to Docker.

I have already created a [Docker image](https://github.com/dvillaj/Docker-JupyterLab-Pandas) for you so you only need to have Docker installed in your machine.

### JupyterLab with Docker

Execute the following command and access to [Jupyerlab](http://loPcalhost:8888/lab)

```
docker-compose up
```

Press Control-C to exit 

## DigitalOcean

This last option consist to have a JupyterLab enviroment on the cloud with DigitalOcean (This is not free!)

Create a new droplet with the following characteristics:

- Docker on Ubuntu 20.04 Image from MarketPlace
- Regular Intel with 1 GB / 1 CPU (The cheapest one)
- London or Frankfurt Location (The nearest one)
- Personal SSH Key (Create one if it is necessary)

This droplet will cost you about 5$ / month

Access the droplet and execute the following sentence ...

```
curl https://gist.githubusercontent.com/dvillaj/74dcdd1acf21f0d4dfb7dd4acc0eb3f6/raw/68ef024807ea533e1c8fa1e4123f1a1a01cce68f/deploy-jupyterlab.sh | bash
```

You may want to use a personal dns thanks to [DuckDNS](https://www.duckdns.org/)