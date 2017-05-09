FROM centos:latest

LABEL MAINTAINER=Nicholas_Wrenn__(nlwrenn@ncsu.edu)

# Install the latest version of MariaDB
RUN yum install -y mariadb-server; \
yum clean all

# Set up the mysql folder and give permissions to mysql user
WORKDIR /var/lib/mysql/
RUN mysql_install_db && \
 cd .. && \
 chown -R mysql:mysql mysql

# Add Database Setup script
RUN mkdir /var/docker/; \
mkdir /var/docker/data
COPY setup.sql /var/docker/data/setup.sql

# Start MySQL
USER mysql
CMD ["mysqld_safe"]

# Execute Setup Script
USER root
WORKDIR /var/docker/data/
RUN ./setup.sql
USER mysql
