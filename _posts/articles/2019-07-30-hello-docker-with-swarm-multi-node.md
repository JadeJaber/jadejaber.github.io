---
published: false
layout: post
excerpt: Run your first docker service/stack with swarm (Multi node)
categories: articles
share: true
tags:
  - docker
  - cloud
  - swarm
  - docker-compose
  - swarm-cluster
title: Run your first docker service/stack with swarm (Multi node)
---
In this article we will run our web application on multi-node swarm cluster.

You may want to read the previous articles: 
- [Hello Docker Macos Host](http://www.jadejaber.com/articles/hello-docker-macos-host/)
- [Hello Docker With Docker Machine](http://www.jadejaber.com/articles/hello-docker-with-docker-machine/)
- [Run your first docker service/stack with swarm (Mono node)](http://www.jadejaber.com/articles/hello-docker-with-swarm-mono-node/)

Create 2 vms with docker-machine
```bash
docker-machine create --driver virtualbox <machine name>
docker-machine create --driver virtualbox machine1
docker-machine create --driver virtualbox machine2
```

List your vms (and get their ips)

```bash
docker-machine ls
```

Initiate your swarm manager on one of the vms

```bash
docker-machine ssh <machine name> "docker swarm init --advertise-addr <myvm1 ip>" 
docker-machine ssh machine1 "docker swarm init --advertise-addr 192.168.99.105"
```

Add a swarm worker to your swarm cluster (the join command is returned by the init command)
```bash
docker-machine ssh machine2 "docker swarm join --token SWMTKN-1-4udgeg63gvom4fliqgomj2vk25zf1mnk03l5yz0stb9cc4y6ft-9q938913xdtt4eymor8d186oq 192.168.99.105:2377"
```

View the nodes inthe swarm

```bash
docker-machine ssh machine1 "docker node ls"
```



