FROM centos:latest

LABEL MAINTAINER=Nicholas_Wrenn__(nlwrenn@ncsu.edu)

RUN yum -y install java-1.8.0-openjdk; \
yum -y install wget; \
yum clean all; \
wget http://www.gtlib.gatech.edu/pub/apache/tomcat/tomcat-8/v8.5.14/bin/apache-tomcat-8.5.14.tar.gz; \
tar -xvf apache-tomcat-8.5.14.tar.gz; \
mv apache-tomcat-8.5.14 /opt/tomcat/; \
rm apache-tomcat*.tar.gz

RUN groupadd tomcat; \
useradd -M -s /bin/false -g tomcat -d /opt/tomcat tomcat; \
cd /opt/tomcat; \
chgrp -R tomcat conf; \
chmod g+rwx conf; \
chmod g+r conf/*

RUN mkdir /var/docker; \
mkdir /var/docker/data

COPY sample.war /opt/tomcat/webapps/sample.war

RUN chown -R tomcat:tomcat /opt/tomcat

WORKDIR /var/docker/data/

USER tomcat

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
