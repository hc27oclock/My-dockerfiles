# Let's try to maintain dockerfile here.
# Last updated: 8/29/2022

FROM rocker/r-ver:4.2.1
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  # for devtools
  libgit2-dev \
  libfreetype-dev \
  libfreetype6-dev \
  libharfbuzz-dev \
  libfribidi-dev
RUN apt-get install -y --no-install-recommends \
  # geospatial for monocle3 and Seurat
  libpq-dev \
  gdal-bin \
  libgdal-dev \
  libudunits2-dev
RUN apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install(c('BiocGenerics', 'DelayedArray', 'DelayedMatrixStats', 'limma', 'lme4', 'S4Vectors', 'SingleCellExperiment', 'SummarizedExperiment', 'batchelor', 'ggrastr', 'remotes'))"
RUN R -e "devtools::install_github('cole-trapnell-lab/leidenbase')"
RUN R -e "devtools::install_github('cole-trapnell-lab/monocle3')"
RUN R -e "BiocManager::install(c('Seurat'))"


