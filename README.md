# Python release of WSL to Windows Path Converter

This script converts WSL-style absolute paths into Windows UNC paths (e.g., `\\wsl.localhost\Ubuntu-24.04\home\user`).
It is designed to work with piped input.

## Prerequisites

- **Python 3.x**: The project includes a `.python-version` file suggesting a specific version preference (check that
  file for details).
- **WSL2 Environment**: The script reads the `WSL_DISTRO_NAME` environment variable to determine the network path
  prefix.

## Environment Setup

The project uses `pyproject.toml` for dependency management. You can set up your environment using your preferred tool:

### Using venv

```bash
python -m venv .venv
source .venv/bin/activate
# Install dependencies if any are listed in pyproject.toml
pip install .
```

## Usage

The script reads paths from `stdin`. You can pipe the output of commands like `pwd` or find directly into it.
Basic Example

``` bash
pwd | python main.py
```

## Configuration

By default, the script looks for the WSL_DISTRO_NAME environment variable. If it is not set, it defaults to
Ubuntu-24.04. You can override this by setting the variable manually:

```bash
export WSL_DISTRO_NAME="MyCustomDistro"
pwd | python main.py
``