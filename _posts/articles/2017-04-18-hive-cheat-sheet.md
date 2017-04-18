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

## 1. Hive options

**Set execution engine**
```shell
set hive.execution.engine=mr/spark/tez;
```

**Set queuename**
```shell
set mapreduce.job.queuename=default;
```

## 2. Hive optimizations
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

## 3. Hive queries

**Deduplicate lines**
```shell
select  <needed fields>
            from 
select *, row_number() over (partition by id order by tech_timestampchargement desc) as rank
from [database.table]
where rank = 1  // to keep only rhe first occurence
```

## 4. Hive procedures

**Tranfert data between clusters**
If it's an external table, you just need to execute a "show create table" from the source cluster and execute it on the new cluster. You just need to copy paste the content of the table folder from a ccuster to the other in the path specified in the create statement.

For internal tables, the process is the same but you may need to execute an "msck repar table" in order to update the tables pointers.

