# conda activate pytorch
mamba update pytorch torchvision torchaudio -c pytorch
python -m pip install --upgrade git+https://github.com/theislab/scvelo.git
# mamba update -y --all && mamba upgrade -y --all && conda clean -y --all
