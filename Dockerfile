FROM debian:stretch

## Java 8
RUN apt-get update
RUN apt-get install -y openjdk-8-jre

## Scala 2.12.8
RUN apt-get update
ADD https://www.scala-lang.org/files/archive/scala-2.12.8.deb .
RUN dpkg -i scala-2.12.8.deb
RUN apt-get install scala

## SBT
RUN apt-get update
RUN apt-get install -y curl gnupg2
RUN apt-get install -y apt-transport-https ca-certificates
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add
RUN apt-get update
RUN apt-get install -y sbt

## NPM 6.8
FROM node:6.8.0

# VIM GIT UNZIP
RUN apt-get update
RUN apt-get install -y vim git unzip

# Ports
EXPOSE 5000
EXPOSE 8000
EXPOSE 8888
EXPOSE 9000

# Volume
RUN mkdir $HOME/project
VOLUME ["$HOME/project"]
