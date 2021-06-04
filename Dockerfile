FROM ubuntu:18.04

ENV TZ=Europe/Warsaw
ENV SBT_VERSION 1.4.9
ENV SCALA_VERSION 2.12.14

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y npm
RUN wget www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb -O /tmp/scala-$SCALA_VERSION.deb && \
    dpkg -i /tmp/scala-$SCALA_VERSION.deb && \
    apt-get update && \
    rm -f /tmp/scala-$SCALA_VERSION.deb

RUN wget https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb -O /tmp/sbt-$SBT_VERSION.deb && \
    dpkg -i /tmp/sbt-$SBT_VERSION.deb && \
    apt-get update && \
    apt-get install sbt -y && \
    rm -f /tmp/sbt-$SBT_VERSION.deb

WORKDIR /app
VOLUME /app/shared

EXPOSE 3000 5000
