# Let's try to maintain dockerfile here.
# Last updated: 11/1/2022

# R 4.2.2 was released on 10/31/2022.
FROM rocker/r-ver:4.2.2
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

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

# Installing necessary R packages in a modular script.
COPY scripts/install_or_fail.R scripts/install_or_fail.R
RUN sudo Rscript scripts/install_or_fail.R


