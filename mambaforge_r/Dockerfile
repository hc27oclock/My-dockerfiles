# Let's try to maintain dockerfile here.
# Last updated: 11/6/2022

FROM mambaorg/micromamba:1.0.0-jammy
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

USER root
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

RUN sudo apt-get update -y --no-install-recommends && \
  sudo apt-get upgrade -y --no-install-recommends && \
  sudo apt-get install -y --no-install-recommends \
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

RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

# GPG settings
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee -a /etc/apt/sources.list.d/r-project.list

# The current /bin/R might conflict with /opt/conda/bin/R.
RUN sudo apt-get update -y --no-install-recommends && \
  sudo apt-get install -y --no-install-recommends \
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
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

# Installing R packages not available in binary
RUN sudo R -e 'install.packages("grr")'
RUN wget -c https://cran.r-project.org/src/contrib/Archive/Matrix.utils/Matrix.utils_0.9.8.tar.gz && \
  sudo R CMD INSTALL Matrix.utils_0.9.8.tar.gz && \
  rm Matrix.utils_0.9.8.tar.gz

COPY install_r_packages.R install_r_packages.R
RUN sudo Rscript install_r_packages.R

ENV PATH="${PATH}:/opt/conda/bin"

# Now, installing python using mamba. Hopefully this does not make conflicts for macs2.
COPY environment.yml environment.yml
RUN micromamba update -n base -y --file ./environment.yml

RUN conda init bash
RUN echo "conda activate base" >> /home/${user}/.bashrc
RUN conda clean -y --all

CMD ["/bin/bash"]
