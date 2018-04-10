FROM ubuntu:16.04
MAINTAINER Martin Fischer "gabeldeluxe@gmail.com"

ENV MAILSLURPER_VERSION 1.13.1

ADD https://github.com/mailslurper/mailslurper/releases/download/${MAILSLURPER_VERSION}/mailslurper-${MAILSLURPER_VERSION}-linux.zip /opt/mailslurper/mailslurper.zip

WORKDIR /opt/mailslurper

RUN apt-get update && apt-get install -y unzip && unzip /opt/mailslurper/mailslurper.zip && \
  sed -i -e 's/localhost/0.0.0.0/g' config.json && \
  sed -i -e 's/2500/25/g' config.json && \
  rm /opt/mailslurper/mailslurper.zip && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/opt/mailslurper/mailslurper"]
