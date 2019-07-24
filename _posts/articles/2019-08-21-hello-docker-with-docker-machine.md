---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - docker
  - springboot
  - swagger
  - docker-machine
---
You may run docker containers on your host or on VMs that are running on your hosts. In this article we will run our springboot application in a docker container that is running on a VM. This VM will run on virtualBox and will be managed by docker-machine.

Youy may want to read the previous article: [Hello Docker Macos Host](http://www.jadejaber.com/articles/hello-docker-macos-host/)

## 1. Install Docker and VirtualBox

### 1.1 Install Docker
Download from [docker.com](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

### 1.2 Install VirtualBox
```bash
brew cask install virtualbox
```

## 2. Instantiate virtual machines with docker-machine (needs VirtualBox installation)

Create a VM called machine1

```bash
brew install docker-machine
docker-machine create machine1
docker-machine ls
docker-machine ip machine1
docker-machine ssh machine1
```
## 3. Run your springboot application in a container on that new VM

Set your environment to let docker run its containers on that new VM

```bash
eval $(docker-machine env machine1)
```

Run an image into a container on machine1

```bash
docker run -p 4000:8080 legabz/hellokube:swagger
```

List the containers running on machine1

```bash
docker ps
``` 

Stop machine1

```bash
docker-machine stop machine1
```
