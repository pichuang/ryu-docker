# Ryu SDN Framework
#
# VERSION 0.0.1


FROM ubuntu:14.04

MAINTAINER Roan Huang <pichuang@cs.nctu.edu.tw>

RUN apt-get update
RUN apt-get install -qy --no-install-recommends python-setuptools python-pip python-eventlet python-lxml python-msgpack python-netaddr python-oslo.config python-paramiko python-routes python-six python-webob unzip wget
RUN pip install -U netaddr six pbr

ENV HOME /root
WORKDIR /root

RUN wget --no-check-certificate https://github.com/osrg/ryu/archive/master.zip
RUN unzip master.zip
RUN cd ryu-master && python setup.py install

# OpenFlow - 6633
# RESTful - 8080
# WEB - 8000
EXPOSE 6633 8080 8000

ADD ./run.sh /root/run.sh
RUN chmod +x /root/run.sh

ENTRYPOINT ["/root/run.sh"]
