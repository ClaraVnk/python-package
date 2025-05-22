# Python Package Helper Scripts

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54) ![PyPi](https://img.shields.io/badge/pypi-%23ececec.svg?style=for-the-badge&logo=pypi&logoColor=1f73b7)

A set of helper scripts to simplify and automate the publishing of Python packages to PyPI.

---

## 🔧 1. `install_publish_alias.sh`

This script installs a global shell alias `publishpy` to quickly publish your Python package from any project directory.

### 📥 Installation

#### English version

```bash
curl -L -o ~/install_publish_alias.sh https://raw.githubusercontent.com/ClaraVnk/python-package/main/install_publish_alias_en.sh
chmod +x ~/install_publish_alias.sh
./install_publish_alias.sh
source ~/.bashrc  # Or `source ~/.zshrc` depending on your shell
```

#### French version

```bash
curl -L -o ~/install_publish_alias.sh https://raw.githubusercontent.com/ClaraVnk/python-package/main/install_publish_alias.sh
chmod +x ~/install_publish_alias.sh
./install_publish_alias.sh
source ~/.bashrc  # Or `source ~/.zshrc` depending on your shell
```

### 🚀 Usage

Navigate to your project folder and simply run:

```bash
publishpy
```

This will:

- Pull the latest changes if the folder is a Git repository.
- Otherwise, clone the GitHub repository into `~/projects`.
- Clean old build artifacts.
- Build the package.
- Upload it to PyPI using the token defined in your `~/.pypirc`.

---

## 📦 2. `python-package.sh`

This script is called automatically by the alias above.

### Assumptions:

- Your project folder name matches the PyPI token section in your `~/.pypirc` AND it also matches your github repo's name
- Your project contains a valid `pyproject.toml` or `setup.py`.
- Each project has a dedicated section in your `~/.pypirc` file.

---

## ⚙️ How to configure your `.pypirc`

1. Create the `.pypirc` file in your home directory (if not already present):

```bash
touch $HOME/.pypirc
```

2. Edit it with your preferred editor:

```bash
nano $HOME/.pypirc
```

3. Create an API token on PyPI (https://pypi.org/manage/account/token/).

4. Configure your `.pypirc` file as follows:

```ini
[distutils]
index-servers =
    pypi
    PROJECT_NAME

[pypi]
username = __token__
password = your-global-api-token

[PROJECT_NAME]
repository = https://upload.pypi.org/legacy/
username = __token__
password = your-project-api-token
```

> **Important:** Replace `PROJECT_NAME` with your actual project name and ensure it matches your GitHub repository folder and PyPI project name.

---

## 📋 Requirements

- Linux environment
- Python 3.x
- `build` module (`pip install build`)
- `twine` module (`pip install twine`)

---

## 🎯 Notes & Tips

- The folder name of your project **must** match your GitHub repository name **and** the `PROJECT_NAME` in your `.pypirc`.
- You can manage multiple projects by adding multiple sections in `.pypirc`.
- Keep your API tokens secure — never commit them to public repositories.

---

## 💡 Contributing

Feel free to open issues or pull requests!  
If you find this tool helpful, please consider starring ⭐️ the repository!

---

## 📄 License

MIT License © ClaraVnk