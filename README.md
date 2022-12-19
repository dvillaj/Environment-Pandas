
# Pandas Environment

This repository offers you a basic setup for a local environment with Pandas and JupyterLab with a PipEnv virtual environmnet


## PipEnv

Install the `pipenv` package ...

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

### Shortcut in Windows

Create a link to launch Jupyter Lab from Windows Explorer:

Click with the left mouse button and set the following properties:
```
Target: C:\Windows\System32\cmd.exe /c "pipenv run jupyter lab --notebook-dir=notebooks"
Start in: [Project's Folder]
```

### Shortcut in Mac

Execute `run-jupyterlab.command` file
