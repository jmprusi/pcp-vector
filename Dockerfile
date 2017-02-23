FROM centos:7

RUN yum install -y pcp-webapi wget \
    && yum clean all \
    && mkdir -p /opt/vector
    
ADD https://dl.bintray.com/netflixoss/downloads/1.1.0/vector.tar.gz /opt/vector/vector.tar.gz

RUN tar -zxf /opt/vector/vector.tar.gz -C /opt/vector/

ADD entrypoint.sh ./entrypoint.sh

ENV PCP_PORT=44323 VECTOR_PORT=9000 PCP_RUN_DIR=/tmp/

# Centos Atomic 
LABEL RUN="docker run -d --privileged --net=host --pid=host --ipc=host -v /sys:/sys:ro -v /etc/localtime:/etc/localtime:ro -v /var/lib/docker:/var/lib/docker:ro -v /run:/run -v /var/log:/var/log -v /dev/log:/dev/log --name=pcp-vector jmprusi/pcp-vector"

ENTRYPOINT ./entrypoint.sh

