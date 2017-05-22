---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - kafka
  - partitions
---
## Environement
- 3 brokers
- Initial topic with 2 partitions
- Expand topic with additionnal partition on 3rd broker

## Topic Creation
```shell
/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --create --zookeeper [Zookeeper URL]:2181 --replication-factor 1 --partitions 1 --topic [topic name]

```
## List topic
```shell
/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --list --zookeeper [Zookeeper URL]:2181
```

## Get partitions
```shell
/usr/hdp/current/kafka-broker/bin/kafka-topics.sh --describe --zookeeper [Zookeeper URL]:2181 --topic [topi name]
```

## Get borker IDs
```shell
/usr/hdp_mount/hdp/2.3.4.7-4/zookeeper/bin/zkCli.sh -server [Zookeeper URL]:2181 ls /brokers/ids
```

## Get broker detail
```shell
/usr/hdp_mount/hdp/2.3.4.7-4/zookeeper/bin/zkCli.sh -server [Zookeeper URL]:2181 get /brokers/ids/[broker id]
```

