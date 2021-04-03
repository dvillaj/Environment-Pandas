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

## Isolated Python Environments

- [PipEnv](https://pipenv.pypa.io/en/latest/)
- [Conda](https://docs.conda.io/projects/conda/en/latest/index.html)

### PipEnv


```
pipenv install pandas tabulate openpyxl lxml html5lib beautifulsoup4 sqlalchemy feather-format matplotlib xlrd scipy ipykernel jupyterlab pexpect ipython-sql

pipenv run jupyter lab
```

### Conda

```
conda create -n environment-pandas
conda activate environment-pandas

conda install pandas tabulate openpyxl lxml html5lib beautifulsoup4 sqlalchemy feather-format matplotlib xlrd scipy ipykernel jupyterlab pexpect

pip install ipython-sql

jupyter lab
```