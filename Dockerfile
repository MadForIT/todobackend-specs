FROM ubuntu:trusty
MAINTAINER Ned Lukies <ned@madforit.com.au>


ENV TERM=xterm-256color

#Set mirrors to AU

RUN sed -i "s/http:\/\/archive./http:\/\/au.archive./g" /etc/apt/sources.list

RUN apt-get update && \
  apt-get install curl -y && \
  curl -sl https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
  apt-get install -y nodejs

COPY . /app
WORKDIR /app

RUN npm install -g mocha && \
    npm install

ENTRYPOINT ["mocha"]
