# Let's try to maintain dockerfile here.
# Last updated: 11/9/2022

FROM mambaorg/micromamba:1.0.0-focal
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
SHELL ["/bin/bash", "-c"]

# install sudo
USER root
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sudo


CMD ["/bin/bash"]
