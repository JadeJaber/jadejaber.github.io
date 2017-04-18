---
published: false
layout: post
excerpt: Hive Cheat Sheet
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - hive
  - storage
  - cheat sheet
  - tips
---

## Hive options

**Set execution engine**
```shell
set hive.execution.engine=mr/spark/tez;
```

**Set queuename**
```shell
set mapreduce.job.queuename=default;
```

## Hive optimizations
**Vectorized execution**
```shell
hive.vectorized.execution.enabled
```
[https://cwiki.apache.org/confluence/display/Hive/Vectorized+Query+Execution](https://cwiki.apache.org/confluence/display/Hive/Vectorized+Query+Execution)

**Map Joins**
```shell
hive.auto.convert.join;
```
[https://cwiki.apache.org/confluence/display/Hive/Vectorized+Query+Execution](https://cwiki.apache.org/confluence/display/Hive/Vectorized+Query+Execution)

## Hive queries
