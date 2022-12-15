
# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab

## Flavors

There are several flavors for a local python environment with JupyterLab in your machine:

- [PipEnv](#PipEnv)
- [Conda](#Conda)


## PipEnv

This is the simplest option. You only need install the `pipenv` package ...

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


### Update packages

```
pipenv update
```

### Remove PipEnv Environment

If you don't need the pipenv environment anymore run ...

```
pipenv --rm
```

### Shortcut in Windows Explorer (Windows Only)

Create a link to launch Jupyter Lab from Windows Explorer:

Click with the left mouse button and set the following properties:
```
Target: C:\Windows\System32\cmd.exe /c "pipenv run jupyter lab --notebook-dir=notebooks"
Start in: [Project's Folder]
```

## Conda

If PipEnv doesn't work (for instance in a new mac with a M1 processor) you have other flavor using conda.

To use conda you need to have a conda client installed from [MiniForge](https://github.com/conda-forge/miniforge) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html)

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

### Update all packages

```
conda update --all
```

### Remove Conda Environment


If you don't need the conda environment anymore run ...

````
conda env remove -n environment-pandas
````

### Shortcut in Windows Explorer (Windows Only)

Create a link to launch Jupyter Lab from Windows Explorer:

Click with the left mouse button and set the following properties:

```
Target: C:\Windows\System32\cmd.exe /c "conda activate environment-pandas && jupyter lab --notebook-dir ./notebooks"
Start in: [Project's Folder]
```