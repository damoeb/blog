---
title: "Docker Cheatsheet"
date: 2016-05-07T22:34:00+01:00
draft: true

tags: 
  - 2016
  - docker
---

**Problem:**
> Cannot connect to the Docker daemon. Is the docker daemon running on this host?
```
**Solution:**
Start daemon
> $ sudo systemctl start docker
```
To start on system boot:
> $ sudo systemctl enable docker
```
&nbsp;

**Problem:**
Delete a docker image from the list <em>docker images</em>

**Solution:**
> $ docker rmi -f [IMAGE-ID...]
```
**Example:**
> $ docker rmi -f a3e4897e64f1
```
&nbsp;

**Problem:**
Build a tagged image from Dockerfile.

**Solution:**
As documented <a href="https://docs.docker.com/engine/reference/commandline/build/">here</a>, **docker build** takes as argument a DIRECTORY, that contains the Dockerfile. You may provide multiple tags.
> $ docker build [-t REPOSITORY:TAG...] DIRECTORY
```
**Example:**
> $ docker build -t traktor/rest:latest -t traktor/rest:0.1 .
```
The generated image(s) will be listed per tag.
> $ docker images
REPOSITORY       TAG         IMAGE ID         CREATED             SIZE
traktor/rest     0.1         55df21616c8d     16 seconds ago      613.7 MB
traktor/rest     latest      55df21616c8d     16 seconds ago      613.7 MB
```
&nbsp;

**Problem:**
Start / Run an image.

**Solution:**
By name
> $ docker run REPOSITORY:TAG
>
```
By hash
> $ docker run HASH
```
**Example:**
> $ docker run traktor/rest:0.1
```

**Problem:**
Image vs Container

**Solution:**

An image is an immutable snapshot, that has been generated with the <code>build</code> command. Local images can be listed with <code>docker images</code>, remote images can be searched with <code>docker search</code>. An image can be started with the <code>run</code> command, which will create a new container.

A container is an instance of an image. Local instances can be listed with <code>docker ps</code>.
&nbsp;

**Problem:**
How to run a multi-container environment?

**Solution:**
<a href="https://docs.docker.com/compose/gettingstarted/">docker compose</a> - the former fig - provides a simple commands, to control all containers, as defined in <code>docker-compose.yml</code>. <code>docker-compose up</code> starts the application, <code>docker-compose down</code> stops it.

&nbsp;

**Problem:**
> $ docker-compose
Cannot open self /usr/local/bin/docker-compose or archive /usr/local/bin/docker-compose.pkg
```

**Solution:**
Reinstall docker-compose directly from the <a href="https://github.com/docker/compose/releases">official release page</a> and install it.

```
 $ sudo curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-Linux-x86_64 &gt; /usr/local/bin/docker-compose
```
