Docker Base Image [![Build Status](https://travis-ci.org/lciolecki/docker-base.svg?branch=master)](https://travis-ci.org/lciolecki/docker-base)
===

This repository provides base docker image. It has dependencies like:

* SSH configuration (https://docs.docker.com/engine/examples/running_ssh_service/)
* wait-for-it (https://github.com/vishnubob/wait-for-it)
* Network tools: net-tools, netcat, dnsutils, telnet 
* openjdk-8-jre, openjdk-8-jdk, docker.io
* Base tools: curl, wget unzip

Installation
---

* Docker Hub: https://hub.docker.com/r/lciolecki/base
* Image: lciolecki/base:latest

Build from Source
---

    docker build -t lciolecki/base