FROM python:3.6

MAINTAINER Anibal Gonzalez <aigonzalez@lojagas.com>

# set environment variables python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#set environment variables oracle
ENV ORACLE_HOME /opt/oracle/instantclient_11_2
ENV LD_RUN_PATH=$ORACLE_HOME
ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_11_2:$LD_LIBRARY_PATH

# copy files oracle client
COPY instantclient/* /tmp/

# apt-get and system utilities
RUN apt-get update && apt-get install -y unzip libaio1 libaio-dev && \
	rm -rf /var/lib/apt/lists/* && \
	mkdir -p /opt/oracle && \
	unzip "/tmp/instantclient*.zip" -d /opt/oracle && \
	ln -s $ORACLE_HOME/libclntsh.so.11.1 $ORACLE_HOME/libclntsh.so

