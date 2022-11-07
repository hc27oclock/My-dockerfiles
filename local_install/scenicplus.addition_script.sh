# conda activate scenicplus
mamba install https://anaconda.org/conda-forge/fa2/0.3.5/download/osx-64/fa2-0.3.5-py310h90acd4f_2.tar.bz2
mamba install https://anaconda.org/bioconda/macs2/2.2.7.1/download/osx-64/macs2-2.2.7.1-py310hd528523_5.tar.bz2
python -m pip install --upgrade git+https://github.com/aertslab/scenicplus.git
# mamba update -y --all && mamba upgrade -y --all && conda clean -y --all
