# Let's try to maintain dockerfile here.
# Last updated: 11/6/2022

FROM ubuntu:jammy
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

USER root
RUN apt-get update -y && \
  apt-get install -y --no-install-recommends \
  sudo \
  wget \
  gpg \
  ca-certificates

ENV user choh
RUN useradd -m -d /home/${user} ${user} && \
  chown -R ${user} /home/${user} && \
  adduser ${user} sudo && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}
WORKDIR /home/${user}

# GPG settings
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo gpg --dearmor -o /usr/share/keyrings/r-project.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/r-project.gpg] https://cloud.r-project.org/bin/linux/ubuntu jammy-cran40/" | sudo tee -a /etc/apt/sources.list.d/r-project.list
RUN sudo apt-get update

RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN sudo apt-get update -y && \
  sudo apt-get install -y --no-install-recommends \
  r-base && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*
RUN sudo R -e 'install.packages("Seurat")'

CMD ["/bin/bash"]
