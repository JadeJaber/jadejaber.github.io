---
published: false
layout: post
excerpt: Run your first docker service/stack with swarm
categories: articles
share: true
tags:
  - docker
  - cloud
  - swarm
  - docker-compose
---
In this post we will deploy a web application with a Load Balancer in a docker Service using swarm.

Youy may want to read the previous articles: 
- [Hello Docker Macos Host](http://www.jadejaber.com/articles/hello-docker-macos-host/)
- [Hello Docker With Docker Machine](http://www.jadejaber.com/articles/hello-docker-with-docker-machine/)


Describe the application in a yml

```bash
docker-compose.yml
```

Init host as a swarm host

```bash
docker swarm init
```

Deploy application

```bash
docker stack deploy -c docker-compose.yml myApp
```

List services

```bash
docker service ls
docker stack services myApp
```

List tasks

```bash
docker service ps myApp_web
docker container ls -q
docker stack ps myApp
```

Stop application

```bash
docker stack rm myApp
```

Take down swarm

```bash
docker swarm leave --force
```