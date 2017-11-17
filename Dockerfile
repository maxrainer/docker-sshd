FROM  ubuntu:16.04
MAINTAINER Markus Rainer "markus.rainer@nts.eu"

RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  openssh-server
RUN apt-get clean
RUN rm /etc/apt/apt.conf.d/docker-clean

RUN mkdir /var/run/sshd
RUN mkdir /home/tunneluser
RUN useradd -d /home/tunneluser tunneluser

VOLUME /home/tunneluser/.ssh
EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
