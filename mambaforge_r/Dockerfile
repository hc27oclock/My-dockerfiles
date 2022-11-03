# Let's try to maintain dockerfile here.
# Last updated: 11/3/2022

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

RUN sudo apt-get update && \
  sudo apt-get upgrade -y && \
  sudo apt-get install -y --no-install-recommends \
  libgit2-dev \
  wget \
  unzip \
  bzip2 \
  build-essential \
  ca-certificates && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*

COPY environment.yml environment.yml
RUN micromamba update -n base -y --file ./environment.yml

ENV PATH="/opt/conda/bin:${PATH}"

RUN conda init bash
RUN echo "conda activate base" >> /home/${user}/.bashrc
RUN conda clean -y --all

COPY install_r_packages.R install_r_packages.R
RUN Rscript install_r_packages.R

CMD ["/bin/bash"]
