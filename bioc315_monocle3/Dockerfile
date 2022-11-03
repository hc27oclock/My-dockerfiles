# Let's try to maintain dockerfile here.
# Last updated: 11/3/2022

# R 4.2.2 was released on 10/31/2022.
FROM rocker/r-ver:4.2.2
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
SHELL ["/bin/bash", "-c"]

# install sudo
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}
WORKDIR /home/${user}

# Required apt packages for Seurat, monocle3
RUN sudo apt-get upgrade -y && \
  sudo apt-get update && \
  sudo apt-get install -y --no-install-recommends \
  # for devtools
  libgit2-dev \
  libfontconfig1-dev \
  libfreetype-dev \
  libfreetype6-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  # for mamba
  bzip2 \
  curl \
  libcurl4-openssl-dev \
  # for nloptr
  cmake \
  # for ggrastr
  libxt-dev \
  libcairo2-dev \
  # linear programming for igraph
  libglpk-dev \
  # geospatial for monocle3 and Seurat
  libpq-dev \
  gdal-bin \
  libgdal-dev \
  libudunits2-dev && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

# Install mamba version 0.24.0, python version 3.10
RUN curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba
RUN export MAMBA_ROOT_PREFIX=~/micromamba
RUN eval "$(./bin/micromamba shell hook -s posix)"
RUN ./bin/micromamba shell init -s bash -p ~/micromamba
CMD ["/bin/bash", "-c"]
RUN source ~/.bashrc


#RUN micromamba activate
#RUN micromamba install -y -c conda-forge coreutils python=3.10 openjdk curl scanpy
#RUN micromamba install -y -c bioconda nextflow bowtie2 trimmomatic star macs2

# Installing necessary R packages in a modular script.
#COPY scripts/install_or_fail.R scripts/install_or_fail.R
#RUN sudo Rscript scripts/install_or_fail.R


