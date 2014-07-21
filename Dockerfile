FROM ubuntu:14.04
MAINTAINER tech@texastribune.org

RUN apt-get update -y

# set up to recognize repo
RUN apt-get install -y wget
RUN wget -O - http://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -
RUN echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" > /etc/apt/sources.list.d/logstash.list
RUN apt-get update -y

# requires java
RUN apt-get install -y openjdk-7-jre-headless

RUN apt-get install logstash

ADD logstash.conf /
ADD start.sh /

# temporary while I'm using it interactively:
RUN apt-get -y install vim
RUN apt-get -y install curl
RUN echo "set -o vi" >> /.bashrc
RUN apt-get -y install python-pip
RUN pip install httpie

#RUN echo "US/Central" > /etc/timezone
#RUN dpkg-reconfigure --frontend noninteractive tzdata

CMD /opt/logstash/bin/logstash -f /logstash.conf

EXPOSE 514
EXPOSE 5000
