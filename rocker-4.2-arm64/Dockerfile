FROM ubuntu:jammy

# Last updated: 11/6/2022
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

USER root
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo \
  wget \
  curl \
  ca-certificates

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${user}

ENV R_VERSION=4.2.2
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC

ENV CRAN=https://packagemanager.rstudio.com/cran/__linux__/jammy/latest
ENV LANG=en_US.UTF-8

COPY scripts rocker_scripts
RUN curl -s -o R4.2.2.tar.gz https://github.com/rocker-org/rocker-versioned2/archive/refs/tags/R4.2.2.tar.gz && \
  tar zxvf R4.2.2.tar.gz

RUN rocker-versioned2-R4.2.2/scripts/install_R_source.sh
RUN rocker-versioned2-R4.2.2/scripts/install_geospatial.sh
RUN rocker-versioned2-R4.2.2/scripts/setup_R.sh

RUN apt-get update && \
  apt-get install -y libcurl4-openssl-dev libssl-dev zlib1g-dev libpng-dev libgeos-dev && \
  apt-get autoremove -y && \
  apt-get autoclean -y

RUN Rscript rocker_scripts/install_seurat.R

USER ${user}

CMD ["R"]
