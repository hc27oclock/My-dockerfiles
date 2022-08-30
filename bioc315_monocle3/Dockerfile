# Let's try to maintain dockerfile here.
# Last updated: 8/30/2022

FROM rocker/r-ver:4.2.1
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
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
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY scripts/install_or_fail.R scripts/install_or_fail.R
RUN Rscript scripts/install_or_fail.R

