# Let's try to maintain dockerfile here.
# Last updated: 9/8/2022

FROM mambaorg/micromamba:0.25.1-jammy-cuda-11.7.1
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
RUN micromamba update -n base -y --file ./environment.yml && \
  conda clean -y --all

RUN conda init bash
RUN echo "conda activate base" >> /home/${user}/.bashrc

CMD ["/opt/conda/bin/python"]
