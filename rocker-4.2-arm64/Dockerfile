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
  sudo

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}
WORKDIR /home/${user}

ENV R_VERSION=4.2.2
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC

ENV CRAN=https://packagemanager.rstudio.com/cran/__linux__/jammy/latest
ENV LANG=en_US.UTF-8

COPY scripts rocker_scripts

RUN sudo wget -O rocker_scripts/install_R_source.sh -c https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_R_source.sh && \
  bash rocker_scripts/install_R_source.sh
RUN sudo wget -O rocker_scripts/install_geospatial.sh -c https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/install_geospatial.sh && \
  bash rocker_scripts/install_geospatial.sh
RUN sudo wget -O rocker_scripts/setup_R.sh -c https://raw.githubusercontent.com/rocker-org/rocker-versioned2/master/scripts/setup_R.sh && \
  bash rocker_scripts/setup_R.sh

RUN sudo apt-get update && \
  sudo apt-get install -y libcurl4-openssl-dev libssl-dev zlib1g-dev libpng-dev libgeos-dev && \
  sudo apt-get autoremove -y && \
  sudo apt-get autoclean -y

RUN sudo Rscript rocker_scripts/install_seurat.R

CMD ["R"]
