# Let's try to maintain dockerfile here.
# Last updated: 8/31/2022

FROM rocker/r-ver:4.2.1
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

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

RUN sudo apt-get update && \
  sudo apt-get upgrade -y && \
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

COPY scripts/install_or_fail.R scripts/install_or_fail.R
RUN chmod 777 scripts/install_or_fail.R
RUN sudo Rscript scripts/install_or_fail.R

