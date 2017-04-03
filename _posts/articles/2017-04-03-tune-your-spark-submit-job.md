---
published: true
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

### 1. A generic sprk-submit call

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

### 2. num-executors and executor-cores

Considering your cluster is executing only this spark job, here is how to take advantage of your cluster's resources: 

Spark recommends not to use more than 5 cores per executor 
> executor-cores = 5

Then you set your **num-executors** as follow : 
> {[(Num_of_cores_per_node - 1)/5 ] x number_of_nodes } - 1

**Explanation :** 
- Num_of_cores_per_node - **1** : We need to keep one core for the OS  on each node
- (Num_of_cores_per_node - 1)**/5** : We divide by the number of cores per executor to get the number of  executors we may instantiate on each node
- {[(Num_of_cores_per_node - 1)/5 ] **x number_of_nodes** } : We multiply it by the number of nodes to get the total number of cores we'll be able to use on our cluster
- {[(Num_of_cores_per_node - 1)/5 ] x number_of_nodes } **- 1** : We substract one executor which will be used for the "Application Master/Spark Driver"


**Example of cluster:**
- 6 nodes
- 16 cores per node 

Result : 
- executor-cores = 5
- num-executors = [(16 -1)/5] * 6 -1 = 18 - 1 = 17

source : [http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-2/](http://blog.cloudera.com/blog/2015/03/how-to-tune-your-apache-spark-jobs-part-2/)