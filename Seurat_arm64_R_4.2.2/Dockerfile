# Let's try to maintain dockerfile here.
# Last updated: 11/6/2022

FROM ubuntu:jammy
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

WORKDIR /home/${user}

RUN apt-get update -y --no-install-recommends && \
  apt-get install -y --no-install-recommends \
  r-base \
  r-cran-seurat && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

USER ${user}
CMD ["/bin/bash"]
