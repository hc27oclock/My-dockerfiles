# Let's try to maintain dockerfile here.
# Last updated: 11/6/2022

FROM ubuntu:jammy
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

USER root
RUN apt-get update -qq -y --no-install-recommends && \
  apt-get install -qq -y --no-install-recommends \
  sudo \
  gpg \
  lsb-core \
  software-properties-common \
  dirmngr

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

WORKDIR /home/${user}

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get update -qq -y --no-install-recommends && \
  apt-get install -qq -y --no-install-recommends \
  r-base \
  r-cran-seurat && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

USER ${user}
CMD ["/bin/bash"]
