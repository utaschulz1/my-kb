# Install from certain channel
conda install --channel conda-forge <PackageName>

# Get list of installed packages in certain environment
conda run -n doublesession pip list 2>/dev/null || conda run -n doublesession conda list
# or if in the env
conda list
# or use explicit path to env
conda list -p ~/miniconda3/envs/doublesession | grep fastapi

