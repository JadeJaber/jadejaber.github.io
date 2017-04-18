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

Quand hive.auto.convert.join est activé, Hive fera un MAPJOIN (plus rapide grâce à l’utilisation de la mémoire) dans le cas où la taille des n-1 tables de la jointure est inférieure ou égale à la hive.auto.convert.join.noconditionaltask.size.
Mais cette dernière doit à son tour être inférieure  à la heap size de HiverServer ou HiveCli (suivant le mode d’accès à Hive). Nous devons donc réduire la valeur de hive.auto.convert.join.noconditionaltask.size pour éviter un OOM.
D’autant plus la compression ORC n’est pas prise en compte par hive.auto.convert.join.noconditionaltask.size. C’est-à-dire qu’une table de 1Go en ORC en fait 10 x plus une fois décompressée et doit donc pouvoir être contenue dans la HeapSize.
Ccl : Avec 256Mo, nous pouvons garder en mémoire jusqu’à 10 x plus, soit 2Go (qui correspond à la heap de HiveServer2)


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

