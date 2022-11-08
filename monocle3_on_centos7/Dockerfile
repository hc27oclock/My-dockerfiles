# Let's try to maintain dockerfile here.
# Last updated: 11/7/2022

# R 4.2.2 was released on 10/31/2022.
FROM registry.access.redhat.com/ubi7/ubi:latest
LABEL maintainer "Hyunwoo Cho <hc27oclock@gmail.com>"

# bash shell
#SHELL ["/bin/bash", "-c"]

# install sudo
RUN yum update && \
  yum install -y \
  bash \
  sudo

#ENV user choh
#RUN useradd -m -d /home/${user} ${user} && \
#  chown -R ${user} /home/${user} && \
#  adduser ${user} sudo && \
#  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${user}
WORKDIR /home/${user}
CMD ["/bin/bash"]
