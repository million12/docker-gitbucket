FROM million12/nginx
MAINTAINER Przemyslaw Ozgo linux@ozgo.info

ENV GITBUCKET_VERSION=4.4 \
    HOSTNAME=localhost \
    CONTEXTPATH="" \
    DATA_DIR=/data/gitbucket

RUN \
    rpm --rebuilddb && yum clean all && \
    yum install -y java-1.8.0-openjdk wget && \
    wget -L -O /opt/gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war

COPY container-files/ /

EXPOSE 80 81 443 29418
