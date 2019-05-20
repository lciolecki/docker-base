FROM ubuntu:bionic

LABEL maintainer="lciolecki<ciolecki.lukasz@gmail.com>"
USER root

# Set environments
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV NOTVISIBLE "in users profile"

# Install base tools
RUN apt-get update -y && \
    apt-get install -y apt-utils \
    net-tools netcat dnsutils telnet \
    openjdk-8-jre openjdk-8-jdk \
    wget curl unzip \
    openssh-server \
    docker.io

# Install wait-for-it
RUN wget -q https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN mv ./wait-for-it.sh /usr/bin/wait-for-it && chmod a+x /usr/bin/wait-for-it

# Configuration sshd
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo 'root:root' | chpasswd

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 22
