# Python Package Helper Scripts

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![PyPi](https://img.shields.io/badge/pypi-%23ececec.svg?style=for-the-badge&logo=pypi&logoColor=1f73b7)

This repository contains two helper scripts to streamline the publishing of Python packages to PyPI.

---

## 🔧 1. `install_publish_alias.sh`

This script installs a global shell alias (`publish_py`) that allows you to quickly publish your package from any project folder.

### 📦 Installation

* ENGLISH : 
```bash
curl -L -o ~/install_publish_alias.sh https://raw.githubusercontent.com/ClaraVnk/python-package/main/install_publish_alias_en.sh
chmod +x ~/install_publish_alias_en.sh
./install_publish_alias.sh
source ~/.bashrc  # or source ~/.zshrc depending on your shell
```

* FRENCH :
```bash
curl -L -o ~/install_publish_alias.sh https://raw.githubusercontent.com/ClaraVnk/python-package/main/install_publish_alias.sh
chmod +x ~/install_publish_alias.sh
./install_publish_alias.sh
source ~/.bashrc  # or source ~/.zshrc depending on your shell
```

### 🚀 Usage

Navigate to your project folder and run:

```bash
publish_py
```

This command will:
- Pull the latest changes from GitHub if the folder is a Git repo.
- Otherwise, it will clone the GitHub repo into `~/projects`.
- Clean old build artifacts.
- Build the package.
- Upload it to PyPI using the token defined in your `~/.pypirc`.

---

## 📦 2. `python-package.sh`

This script is automatically called by the alias above.

It assumes:
- The name of your project folder matches the name of your PyPI token section in `~/.pypirc`.
- You have a valid `pyproject.toml` or `setup.py` to build the package.
- Each project has its own `[project-name]` section in `~/.pypirc`.

---

## How to setup .pypirc

1. Create the .pypirc file on your computer
```bash
touch $HOME/.pypirc
```
2. Edit the file
```bash
nano .pypirc
```
3. Create an API token on Pypi
4. Configure the file
```ini
[distutils]
  index-servers =
    pypi
    PROJECT_NAME

[pypi]
  username = __token__
  password = # global API token
[PROJECT_NAME]
  repository = https://upload.pypi.org/legacy/
  username = __token__
  password = # project API token
```

---

## IMPORTANT

Your folder directory's name MUST match your github repository AND your PROJECT_NAME on Pypi.

---

## Requirements

- LINUX
- Python 3.x
- `build` module (`pip install build`)
- `twine` module (`pip install twine`)
