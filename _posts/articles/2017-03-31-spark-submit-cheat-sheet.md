---
published: true
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
If your spark-submit needs some additional jars, you may add some missing jars to your spark submit using --jars option
```shell
spark-submit --jars /usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-api-jdo-3.2.6.jar,/usr/hdp_mount/hdp/2.3.4.7-4/spark/lib/spark-assembly-1.5.2.2.3.4.7-4-hadoop2.7.1.2.3.4.7-4.jar  --class RequeteKindiClass --master yarn --deploy-mode cluster --queue default ./BenchmarkHawk.jar
```

But it may fail with the following error : 
```shell
...changed on src filesystem (expected 1434549639128, was 1434549642191...
```

In that case you may copy the jars to HDFS and call them in spark-submit using --conf spark.yarn.jar or spark.yarn.archive if you have many jars
```shell
hdfs dfs -copyFromLocal /usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-api-jdo-3.2.6.jar  /user/spark/datanucleus-api-jdo.jar

hdfs dfs -copyFromLocal /usr/hdp_mount/hdp/2.3.4.7-4/spark/lib/spark-assembly-1.5.2.2.3.4.7-4-hadoop2.7.1.2.3.4.7-4.jar /user/spark/spark-assembly.jar 
 
spark-submit --conf spark.yarn.jar=hdfs:///user/spark/spark-assembly.jar --conf spark.yarn.jar=hdfs:///user/spark/datanucleus-api-jdo.jar --class RequeteKindiClass --master yarn --deploy-mode cluster --queue q_datalab  ./BenchmarkHawk.jar

spark-submit --conf spark.yarn.archive=hdfs:///user/spark/  --class RequeteKindiClass --master yarn --deploy-mode cluster --queue q_datalab  ./BenchmarkHawk.jar
```
