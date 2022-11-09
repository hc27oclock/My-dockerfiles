# Let's try to maintain dockerfile here.
# Last updated: 11/9/2022

FROM mambaorg/micromamba:1.0.0-focal
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
SHELL ["/bin/bash", "-c"]

# install sudo
USER root
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo

WORKDIR /work

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

COPY environment.yml environment.yml
RUN micromamba update -n base -y --file ./environment.yml && \
  conda init bash && \
  conda clean -y --all

# GPG settings
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" | sudo tee -a /etc/apt/sources.list.d/r-project.list

RUN apt-get update -y --no-install-recommends && \
  apt-get install -y --no-install-recommends \
  r-base \
  r-cran-devtools \
  r-cran-xml \
  r-cran-openxlsx \
  r-cran-tidyverse \
  r-cran-rcurl \
  r-cran-nloptr \
  r-cran-ggrepel \
  r-cran-pheatmap \
  r-cran-seurat \
  r-cran-biocmanager \
  r-bioc-all \
  r-bioc-bsgenome \
  r-bioc-deseq2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*



RUN conda activate base



CMD ["/bin/bash"]
