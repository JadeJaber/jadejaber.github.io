---
published: true
layout: post
excerpt: Zookeeper Cheat Sheet
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - cheat sheet
  - zookeeper
---
## What is it for ?
ZooKeeper is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. All of these kinds of services are used in some form or another by distributed applications.

## Get conected

You just need to specify the quroum
```shell
/usr/hdp/current/zookeeper-client/bin/zkCli.sh -server [server]:2181,[server]:2181,[server]:2181

ls /hiveserver2
```
