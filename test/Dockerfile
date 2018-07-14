FROM openjdk:8-jdk

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "\ndeb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests ansible && \
    mkdir -p /ansible 

WORKDIR /ansible
