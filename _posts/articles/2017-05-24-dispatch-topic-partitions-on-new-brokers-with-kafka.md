---
published: true
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
- 2 brokers
- Initial topic with 1 partitions
- Expand topic with additionnal partition on 2nd broker

## Topic Creation
```shell
./bin/kafka-topics.sh --create --zookeeper [Zookeeper URL]:2181 --replication-factor 1 --partitions 1 --topic [topic name]
```
Note : Replica factor has to be lower or equal to the total number of brokers.

## List topic
```shell
./bin/kafka-topics.sh --list --zookeeper [Zookeeper URL]:2181
```

## Get partitions
```shell
./bin/kafka-topics.sh --describe --zookeeper [Zookeeper URL]:2181 --topic [topic name]
```

## Get borker IDs
```shell
/usr/hdp_mount/hdp/2.3.4.7-4/zookeeper/bin/zkCli.sh -server [Zookeeper URL]:2181 ls /brokers/ids
```

## Get broker detail
```shell
/usr/hdp_mount/hdp/2.3.4.7-4/zookeeper/bin/zkCli.sh -server [Zookeeper URL]:2181 get /brokers/ids/[broker id]
```

## Add partitions to you topic
```shell
 /usr/hdp/current/kafka-broker/bin/kafka-topics.sh  --alter --topic [topic name] --partitions 2  --zookeeper Zookeeper URL]:2181 
```

## Generate json file to re-distribute topic partitions

```json
{"topics": [{"topic": "topic name"}],"version":1}
```

```shell
./bin/kafka-reassign-partitions.sh --zookeeper [Zookeeper URL]:2181 --topics-to-move-json-file ./topics-to-move.json --broker-list "1005,1006"  --generate
```
Note : This comamnd will generate a json configuration file that should be given as a parameter to the next command which will aplly the redistribution.

## Apply the redistribution
```json
{"version":1,"partitions":[{"topic":"repartition","partition":0,"replicas":[1005]},{"topic":"repartition","partition":1,"replicas":[1006]}]}
```

```shell
 ./bin/kafka-reassign-partitions.sh --zookeeper [Zookeeper URL]:2181 --reassignment-json-file expand-cluster-reassignment.json --execute
```

## Verify the redistribution
```shell
 ./bin/kafka-reassign-partitions.sh --zookeeper [Zookeeper URL]:2181 --reassignment-json-file expand-cluster-reassignment.json --verify
```
