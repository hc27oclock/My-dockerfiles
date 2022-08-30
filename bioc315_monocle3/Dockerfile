# Let's try to maintain dockerfile here.
# Last updated: 8/29/2022

FROM rocker/r-ver:4.2.1
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  libpq-dev \
  gdal-bin \
  libgdal-dev \
  libudunits2-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install(c('BiocGenerics', 'limma', 'DelayedArray', 'DelayedMatrixStats', 'S4Vectors', 'SingleCellExperiment', 'SummarizedExperiment', 'batchelor'))"
RUN R -e "BiocManager::install('cole-trapnell-lab/leidenbase')"
RUN R -e "BiocManager::install('cole-trapnell-lab/monocle3')"
RUN R -e "BiocManager::install(c('Seurat'))"

