### GitBucket in Docker (Nginx/HTTP2)

[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-gitbucket/master.svg)](https://circleci.com/gh/million12/docker-gitbucket)
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-gitbucket.svg)](https://github.com/million12/docker-gitbucket/issues)  
[![Stars](https://img.shields.io/github/stars/million12/docker-gitbucket.svg?style=social&label=Stars)]()
[![Fork](https://img.shields.io/github/forks/million12/docker-gitbucket.svg?style=social&label=Fork)]()  
[![Docker Start](https://img.shields.io/docker/stars/million12/gitbucket.svg)](https://hub.docker.com/r/million12/gitbucket)
[![Docker Pulls](https://img.shields.io/docker/pulls/million12/gitbucket.svg)](https://hub.docker.com/r/million12/gitbucket)
[![Docker Auto](https://img.shields.io/docker/automated/million12/gitbucket.svg)](https://hub.docker.com/r/million12/gitbucket)  
[![](https://img.shields.io/github/release/million12/docker-gitbucket.svg)](http://microbadger.com/images/million12/gitbucket)

Felling like supporting me in my projects use donate button. Thank You!  
[![](https://img.shields.io/badge/donate-PayPal-blue.svg)](https://www.paypal.me/POzgo)

**NOTE: This image was refactored and stripped down to alpine version with Java 8 and Gitbucket**
If users need `ssl` support please put it behind HAProxy or Nginex server. 

[Docker Image](https://registry.hub.docker.com/u/million12/gitbucket/) with GitBucket server based on Alpine Linux for lightweight 

### Environmental Variable

- `CONTEXTPATH` runtime variable `--prefix=`
- `HOSTNAME` runtime variable `--host=`
- `DATA_DIR` runtime variable `--gitbucket.home=`

### Usage

    docker run \
      -d \
      --name gitbucket \
      -p 80:80 \
      -p 29418:29418 \
      million12/gitbucket

Mount data to host os and edit some variables.

    docker run \
      -d \
      --name gitbucket \
      -p 80:80 \
      -p 29418:29418 \
      -e HOSTNAME=myhostanme.com \
      -e DATA_DIR=/my/custom/container/dir \
      -v /my/host/dir:/my/custom/container/dir \
      million12/gitbucket

### Build

    docker build -t million12/gitbucket .

### Access GitBucket

- HTTP: http://docker.ip
- SSL/HTTP2: https://docker.ip
- SSH through port `29418`

**Default Login and Password is `root:root`**

Docker troubleshooting
======================

Use docker command to see if all required containers are up and running:
```
$ docker ps
```

Check logs of gitbucket server container:
```
$ docker logs gitbucket
```

Sometimes you might just want to review how things are deployed inside a running
 container, you can do this by executing a _bash shell_ through _docker's
 exec_ command:
```
docker exec -ti gitbucket /bin/bash
```

History of an image and size of layers:
```
docker history --no-trunc=true million12/gitbucket | tr -s ' ' | tail -n+2 | awk -F " ago " '{print $2}'
```

## Author

Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by [Prototype Brewery](http://prototypebrewery.io/)** - the new prototyping tool for building highly-interactive prototypes of your website or web app. Built on top of [Neos CMS](https://www.neos.io/) and [Zurb Foundation](http://foundation.zurb.com/) framework.
