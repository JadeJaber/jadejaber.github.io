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

OR

```bash
eval $(docker-machine env machine1)
docker swarm init --advertise-addr <myvm1 ip> 
docker swarm init --advertise-addr 192.168.99.105
```

Add a swarm worker to your swarm cluster (the join command is returned by the "swarm init" command above)

```bash
docker-machine ssh machine2 "docker swarm join --token SWMTKN-1-4udgeg63gvom4fliqgomj2vk25zf1mnk03l5yz0stb9cc4y6ft-9q938913xdtt4eymor8d186oq 192.168.99.105:2377"
```

OR 

```bash
eval $(docker-machine env machine2)
docker swarm join --token SWMTKN-1-4udgeg63gvom4fliqgomj2vk25zf1mnk03l5yz0stb9cc4y6ft-9q938913xdtt4eymor8d186oq 192.168.99.105:2377
```

View the nodes in the swarm

```bash
docker-machine ssh machine1 "docker node ls"
```

To leave swarm, you need to leave it from each node with

```bash
docker swarm leave
```

Deploy your application with the same compose-yml that we have used previously.  
```bash
> docker stack deploy -c docker-compose.yml myApp_web
Creating network myApp_webnet
Creating service myApp_web

> docker service ps myApp
ID                  NAME                IMAGE                      NODE                DESIRED STATE       CURRENT STATE                ERROR               PORTS
yp8nldzgaclu        myApp_web.1         legabz/hellokube:swagger   machine1            Running             Running about a minute ago
mz30tjee1e32        myApp_web.2         legabz/hellokube:swagger   machine2            Running             Running 33 seconds ago
mll62ap0cvt1        myApp_web.3         legabz/hellokube:swagger   machine2            Running             Running 33 seconds ago
ly087nai6eia        myApp_web.4         legabz/hellokube:swagger   machine1            Running             Running about a minute ago
i7ejraewwcge        myApp_web.5         legabz/hellokube:swagger   machine2            Running             Running 33 seconds ago
```
