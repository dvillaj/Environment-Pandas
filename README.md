# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab + Git Plugin

All your notebooks will be located in the `notebooks` directory.

## Flavors

There are several flavors for a local python environment with JupyterLab in your machine:

- [PipEnv](https://pipenv.pypa.io/en/latest/)
- [Conda](https://docs.conda.io/projects/conda/en/latest/index.html)
- [Docker](https://www.docker.com/)

## PipEnv

This is the simplest option. You only need python installed in your machine and install the `pipenv` package ...

```
pip install pipenv
```

Create a new isolated virtual environment and install all the packages from `requeriments.txt` file ...

```
pipenv install -r requeriments.txt
```

### Jupyter lab wit pipenv

Run Jupyter lab

```
pipenv run jupyter lab --notebook-dir ./notebooks
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
conda create --yes -n environment-pandas

```

Activate the environment and install all the needed packages from `requeriments.txt` file ...

```
conda activate environment-pandas
conda install --yes --file requeriments.txt
```

### Jupyter Lab with Conda

To run JupyterLab ...

```
conda activate environment-pandas
jupyter lab --notebook-dir ./notebooks
```

### Remove Conda Environment


If you don't neeed the conda environment anymore run ...

````
conda env remove -n environment-pandas
````

## Docker

The last flavor to run a local jupyterlab in your machine is to use Docker.

I have already created a [Docker image](https://github.com/dvillaj/Docker-JupyterLab-Pandas) for you so you only need to have Docker installed in your machine.

### Jupyter Lab with Docker

Execute the following command and access to [Jupyerlab](http://loPcalhost:8888/lab)

```
docker-compose up
```

Press Control-C to exit 