# Let's try to maintain dockerfile here.
# Last updated: 11/6/2022
# As of this day, cloud.r-project.org ubuntu jammy binary does not support arm64, which I need.

FROM ubuntu:jammy
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

USER root
RUN apt-get update -y && \
  apt-get install -y --no-install-recommends \
  sudo

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${user}

RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN apt-get update -y && \
  apt-get install -y \
  r-base \
  r-cran-seurat && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
