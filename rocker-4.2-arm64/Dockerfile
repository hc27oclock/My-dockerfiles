FROM ubuntu:focal

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \
      org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2" \
      org.opencontainers.image.vendor="Rocker Project" \
      org.opencontainers.image.authors="Carl Boettiger <cboettig@ropensci.org>"

ENV R_VERSION=4.2.1
ENV R_HOME=/usr/local/lib/R
ENV TZ=Etc/UTC

COPY scripts/install_R_source.sh /rocker_scripts/install_R_source.sh

RUN /rocker_scripts/install_R_source.sh

ENV CRAN=https://packagemanager.rstudio.com/cran/__linux__/focal/latest
ENV LANG=en_US.UTF-8

COPY scripts /rocker_scripts

RUN /rocker_scripts/setup_R.sh

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev libssl-dev zlib1g-dev libpng-dev libgeos-dev
RUN apt-get autoremove -y
RUN apt-get autoclean -y

RUN Rscript /rocker_scripts/install_seurat.R

CMD ["R"]
