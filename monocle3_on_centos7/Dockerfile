# Let's try to maintain dockerfile here.
# Last updated: 11/7/2022

# R 4.2.2 was released on 10/31/2022.
FROM centos:centos7
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
#SHELL ["/bin/bash", "-c"]

# install binary packages
RUN yum install -y epel-release && \
  yum update -y && \
  yum group install -y "Development Tools" && \
  yum install -y \
  wget \
  which \
  readline-devel \
  libXt-devel \
  bzip2-devel \
  zlib-devel \
  xz-devel \
  pcre2-devel \
  libcurl-devel \
  libxml2-devel \
  openssl-devel \
  fontconfig-devel \
  nlopt-devel \
  harfbuzz-devel \
  fribidi-devel \
  freetype-devel \
  libpng-devel \
  libtiff-devel \
  libjpeg-turbo-devel \
  gdal-devel

WORKDIR /work

# compile R
RUN wget -c https://cran.r-project.org/src/base/R-4/R-4.2.2.tar.gz && \
  tar zxvf R-4.2.2.tar.gz && \
  cd R-4.2.2 && \
  ./configure && \
  make && \
  make install && \
  rm -f /work/R-4.2.2.tar.gz

WORKDIR /work

# compile more packages on R
RUN R -e 'install.packages(c("devtools", "BiocManager", "grr"), repos="https://cloud.r-project.org")'
RUN wget -c https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.8.tar.gz && \
  R CMD INSTALL Matrix.utils_0.9.8.tar.gz && \
  rm -f /work/Matrix.utils_0.9.8.tar.gz
RUN R -e 'BiocManager::install(c("BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "lme4", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment", "batchelor", "HDF5Array", "terra", "ggrastr"))'
RUN R -e 'devtools::install_github("cole-trapnell-lab/monocle3")'

CMD ["/bin/bash"]
