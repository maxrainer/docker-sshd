FROM  ubuntu:16.04
MAINTAINER Markus Rainer "markus.rainer@nts.eu"

RUN apt-get update -y && \
  openssh-server

RUN apt-get clean
RUN rm /etc/apt/apt.conf.d/docker-clean

RUN mkdir /var/run/sshd

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
