---
published: false
layout: post
excerpt: Spark submit cheat sheet
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - spark
  - spark-submit
  - cheat sheet
---
Your may add some missing jars to your spark submit using --jars

```shell
spark-submit --jars /usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-api-jdo-3.2.6.jar,/usr/hdp_mount/hdp/2.3.4.7-4/spark/lib/spark-assembly-1.5.2.2.3.4.7-4-hadoop2.7.1.2.3.4.7-4.jar  --class RequeteKindiClass --master yarn --deploy-mode cluster --queue default ./BenchmarkHawk.jar
```

