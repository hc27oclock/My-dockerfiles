# Let's try to maintain dockerfile here.
# Last updated: 11/7/2022

# R 4.2.2 was released on 10/31/2022.
FROM centos:centos7
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
SHELL ["/bin/bash", "-c"]

# install binary packages
RUN yum install -y centos-release-scl
RUN yum install -y devtoolset-7-gcc*
RUN scl enable devtoolset-7 bash
RUN yum install -y epel-release && \
  yum update -y && \
  yum group install -y "Development Tools" && \
  yum install -y \
  wget \
  which \
  python-devel \
  nlopt-devel \
  readline-devel \
  libXt-devel \
  bzip2-devel \
  zlib-devel \
  xz-devel \
  cairo-devel \
  pcre2-devel \
  libcurl-devel \
  libxml2-devel \
  openssl-devel \
  udunits2-devel \
  fontconfig-devel \
  harfbuzz-devel \
  fribidi-devel \
  freetype-devel \
  libpng-devel \
  libtiff-devel \
  libjpeg-turbo-devel \
  gdal-devel \
  geos-devel \
  proj-devel

WORKDIR /work

# prerequisite: compile cmake
RUN wget -c https://github.com/Kitware/CMake/releases/download/v3.24.3/cmake-3.24.3.tar.gz && \
  tar zxvf cmake-3.24.3.tar.gz && \
  cd cmake-3.24.3 && \
  ./configure && \
  make -j $(( 2 * $(cat /proc/cpuinfo | egrep ^processor | wc -l) )) && \
  make install && \
  rm -f cmake-3.24.3.tar.gz

WORKDIR /work

# prerequisite: compile gdal
RUN wget -c https://github.com/OSGeo/gdal/releases/download/v3.5.3/gdal-3.5.3.tar.gz && \
  tar zxvf gdal-3.5.3.tar.gz && \
  cd gdal-3.5.3 && \
  ./configure && \
  make -j $(( 2 * $(cat /proc/cpuinfo | egrep ^processor | wc -l) )) && \
  make install && \
  rm -f gdal-3.5.3.tar.gz

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
RUN R -e 'withr::with_makevars(new=c(CXX14="g++", CXX14FLAGS="-g -O2 $(LTO)", CXX14PICFLAGS="-fpic", CXX14STD="-std=gnu++14"), code={BiocManager::install("Seurat")})'
RUN R -e 'BiocManager::install(c("BiocGenerics", "DelayedArray", "DelayedMatrixStats", "limma", "lme4", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment", "batchelor", "HDF5Array", "terra", "ggrastr"))'
RUN R -e 'devtools::install_github("cole-trapnell-lab/monocle3")'

CMD ["/bin/bash"]
