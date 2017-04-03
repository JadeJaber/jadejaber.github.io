---
published: false
layout: post
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - spark
  - execution engine
  - tips
  - spark-submit
  - optimization
---

### A generic sprk-submit call

When submitting a spark-submit job, you may tune it using its several options

```shell
./bin/spark-submit --class org.apache.spark.examples.SparkPi \
--master yarn-cluster \
--num-executors 3 \
--driver-memory 4g \
--executor-memory 2g \
--executor-cores 1 \
--queue thequeue \
lib/spark-examples*.jar \
10
```

### num-executors and executor-cores

Considering your nodes are executing this spark job, here is hwo to take advantage of your cluster power : 

Spark recommends not to use more than 5 core/executor (executor-cores = 5). 

Then you set your num-executors as follow : 
[(Num_of_cores_per_node - 1)/5 ] * number_of_nodes - 1

Explanation : 

**Example of cluster:**
- 6 nodes
- 16 cores per node 

Result : 
- executor-cores = 5
- num-executors = [(16 -1)/5] * 6 -1 = 18 - 1 = 17


