FROM jenkins/jenkins:lts

SHELL ["/bin/bash", "-x", "-c", "-o", "pipefail"]

LABEL maintainer="Jonathan Ballet <jon@multani.info>"

ENV NOMAD_VERSION 0.12.3

USER root
RUN wget -q -O /tmp/nomad_${NOMAD_VERSION}_linux_amd64.zip https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip
RUN unzip -d /tmp /tmp/nomad_${NOMAD_VERSION}_linux_amd64.zip
RUN chmod 755 /tmp/nomad && mv /tmp/nomad /usr/local/bin/

USER jenkins
RUN nomad version
