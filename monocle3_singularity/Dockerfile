# Let's try to maintain dockerfile here.
# Last updated: 11/9/2022

FROM rocker/r-ver:4.2.2
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
SHELL ["/bin/bash", "-c"]

# install sudo
USER root
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo

RUN apt-get update -y --no-install-recommends && \
  apt-get upgrade -y --no-install-recommends && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  tzdata \
  git \
  libgit2-dev \
  wget \
  unzip \
  bzip2 \
  gpg \
  gfortran \
  libreadline-dev \
  libbz2-dev \
  libfontconfig1-dev \
  liblapack-dev \
  libopenblas-dev \
  # for nloptr
  libudunits2-dev \
  cmake \
  # for ggrastr
  libxt-dev \
  libcairo2-dev \
  # linear programming for igraph
  libglpk-dev \
  # for systemfonts used in monocle3
  libharfbuzz-dev \
  libfribidi-dev \
  # geospatial for monocle3 and Seurat
  libpq-dev \
  gdal-bin \
  libgdal-dev \
  libudunits2-dev \
  build-essential \
  ca-certificates

WORKDIR /work
# compile R
RUN wget -c https://cran.r-project.org/src/base/R-4/R-4.2.2.tar.gz && \
  tar zxvf R-4.2.2.tar.gz && \
  cd R-4.2.2 && \
  ./configure && \
  make -j $(( 2 * $(cat /proc/cpuinfo | egrep ^processor | wc -l) )) && \
  make install && \
  rm -f /work/R-4.2.2.tar.gz

WORKDIR /work
# compile more packages on R
RUN echo 'options(Ncpus=2 * parallel::detectCores())' >> /root/.Rprofile
RUN R -e 'install.packages(c("devtools", "BiocManager", "grr"), repos="https://cloud.r-project.org")'
RUN wget -c https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.8.tar.gz && \
  R CMD INSTALL Matrix.utils_0.9.8.tar.gz && \
  rm -f /work/Matrix.utils_0.9.8.tar.gz
RUN R -e 'BiocManager::install(c("BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "lme4", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment", "batchelor", "HDF5Array", "terra", "ggrastr"))'
RUN R -e 'devtools::install_github("cole-trapnell-lab/monocle3")'


CMD ["/bin/bash"]
