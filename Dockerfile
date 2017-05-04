FROM centos:latest

LABEL MAINTAINER=Nicholas_Wrenn__(nlwrenn@ncsu.edu)

RUN yum -y install java-1.8.0-openjdk; \
yum -y install wget; \
yum clean all;
wget http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-8/v8.5.14/bin/apache-tomcat-8.5.14.tar.gz; \
tar -xvf apache-tomcat-8.5.14.tar.gz; \
rm apache-tomcat*.tar.gz

RUN groupadd tomcat; \
useradd -M -s /bin/false -g tomcat -d /opt/tomcat tomcat; \
cd /opt/tomcat; \
chgrp -R tomcat conf; \
chmod g+rwx conf;
chmod g+r conf/*

RUN yum install -y mariadb-server; \
yum clean all

RUN yum install -y python-setuptools; \
yum clean all; \
easy_install supervisor; \
mkdir /var/log/supervisor/; \
mkdir /etc/supervisor/
COPY supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /var/lib/mysql/

RUN mysql_install_db && \
 cd .. && \
 chown -R mysql:mysql mysql
 
RUN mkdir /var/docker/; \
mkdir /var/docker/data

COPY setup.sql /var/docker/data/setup.sql
COPY myServer.war /opt/tomcat/webapps/myServer.war

RUN chown -R tomcat:tomcat /opt/tomcat

WORKDIR /var/docker/data/
RUN ./setup.sql

CMD ["supervisord"]
