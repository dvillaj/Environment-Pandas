# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab

## Python Distibution

You will need Python installed in your local machine.

I recomment one of the following options:

- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
- [Miniforge](https://github.com/conda-forge/miniforge)


```
python --version
pip --version
```

## PipEnv

PipEnv will provide you a python isolated environment

### Install PipEnv

```
pip install pipenv
```

### Install Python Packages

```
pipenv install
```

### JupyterLab

``` 
pipenv run jupyter lab
```