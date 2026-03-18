# delete existing uv.lock and pyproject.toml and .venv to reset environment
rm -rf uv.lock pyproject.toml .venv

# 1. Initialize project and add dependencies
uv init         # creates pyproject.toml with defaults
uv add          # auto-creates  .venv and installs depencies from pyproject.toml
uv add crawl4ai==0.6.2  # install specific version (or without) and everything in pyproject.toml that wasnt yet installed and updates pyproject.toml and uv.lock


# other cases: manually create venv and activate it
uv venv --python 3.12        # specific version
uv venv myenv                # custom name/path
source .venv/bin/activate    # Linux/macOS/WSL
uv python pin 3.13           # update pyproject.toml to require python 3.13, then run uv add to update .venv and uv.lock

# run with uv run
uv run python src/server.py # runs with .venv python and dependencies
# when .venv is active, you can also run with python directly
python src/server.py
