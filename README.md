### GitBucket in Docker (Nginx/HTTP2)

[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-gitbucket.svg)](https://github.com/million12/docker-gitbucket/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-gitbucket.svg)](https://github.com/million12/docker-gitbucket)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-gitbucket.svg)](https://github.com/million12/docker-gitbucket)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/gitbucket.svg)](https://hub.docker.com/r/million12/gitbucket)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/gitbucket.svg)](https://hub.docker.com/r/million12/gitbucket)  
[![](https://images.microbadger.com/badges/version/million12/gitbucket:4.15.0.svg)](http://microbadger.com/images/polinux/gitlab-ce)  
[![](https://images.microbadger.com/badges/image/million12/gitbucket.svg)](http://microbadger.com/images/million12/gitbucket)

[![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/?repo=https://github.com/million12/docker-gitbucket/tree/master)

[Docker Image](https://registry.hub.docker.com/u/million12/gitbucket/) with GitBucket server using [million12/nginx](https://hub.docker.com/r/million12/nginx/) docker image as base. (HTTP2 and HAProxy SSL termination ready.)

### Build Status

* [![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-gitbucket/master.svg)](https://circleci.com/gh/million12/docker-gitbucket)

### Environmental Variable

- `CONTEXTPATH` runtime variable `--prefix=`
- `HOSTNAME` runtime variable `--host=`
- `DATA_DIR` runtime variable `--gitbucket.home=`

#### Nginx Features

##### - HTTP/2 support
Container is built with `http/2` support and by default it listens on port `443`.  
Make sure you open it on `docker run`.  
Port `81` is used by default for load balancing (`HAProxy`) ssl termination.

##### - dummy SSL certificates
The default *catch-all* vhost is configured to work on HTTPS as well.

##### - error logging

Nginx `error_log` is set to `stderr` and therefore Nginx log is available only via `docker logs [contaienr]`, together with supervisor logs.

This is probably best approach if you'd like to source your logs from outside the container (e.g. via `docker logs` or CoreOS `journald`) and you don't want to worry about logging and log management inside your container.

##### - graceful reload after config change

Folders `/etc/nginx/` and `/data/conf/nginx/` are monitored for any config changes and, when they happen, Nginx is gracefully reloaded.

##### - Nginx status page

Nginx status page is configured under `/nginx_status` URL on the default vhost. Also see `STATUS_PAGE_ALLOWED_IP` env variable described below.
Eample output:  

	Active connections: 1
	server accepts handled requests
	11475 11475 13566
	Reading: 0 Writing: 1 Waiting: 0

### Usage

    docker run \
      -d \
      --name gitbucket \
      -p 80:80 \
      -p 443:443 \
      -p 29418:29418 \
      million12/gitbucket

Mount data to host os and edit some variables.

    docker run \
      -d \
      --name gitbucket \
      -p 80:80 \
      -p 443:443 \
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
