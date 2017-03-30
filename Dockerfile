FROM polinux/pi-nginx

ENV GITBUCKET_VERSION=4.10 \
    HOSTNAME=localhost \
    CONTEXTPATH="" \
    DATA_DIR=/data/gitbucket

RUN \
  apk add --update openjdk8 wget && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /opt && \
  wget -L -O /opt/gitbucket.war https://github.com/gitbucket/gitbucket/releases/download/${GITBUCKET_VERSION}/gitbucket.war

COPY container-files/ /

EXPOSE 80 81 443 29418
