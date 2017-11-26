# Reference Docs: https://book.cuberite.org/#1.2

FROM centos:7.4.1708
MAINTAINER Timothy M. Crider <timcrider@gmail.com>

# Base system updates
RUN yum update -y \
	&& yum install -y git gcc g++ make cmake nano openssl \
	&& yum groupinstall -y "Development Tools" "Development Libraries"

# Fetch cuberite
RUN mkdir -p /opt/SOURCES \
	&& cd /opt/SOURCES \
	&& git clone --recursive https://github.com/cuberite/cuberite.git

# Build cuberite
RUN cd /opt/SOURCES/cuberite \
	&& cmake . -DCMAKE_BUILD_TYPE=RELEASE \
	&& make -j 4

# Configure cuberite
COPY assets/config/webadmin.ini /opt/SOURCES/cuberite/Server
COPY assets/scripts/cuberite-start-server.sh /bin/cuberite-start-server.sh
COPY assets/scripts/cuberite-create-https-certs.sh /bin/cuberite-create-https-certs.sh

RUN chmod 0700 /bin/cuberite-*.sh

# Webmin
EXPOSE 8080

# Minecraft Server
EXPOSE 25565

