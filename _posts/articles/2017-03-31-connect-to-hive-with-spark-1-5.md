---
published: true
layout: post
excerpt: Connect to hive with Spark 1.5
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - spark-sql
  - spark-submit
  - hive
---

**My class**
```java
import java.util.*;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.SparkContext;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.SparkConf;
import org.apache.spark.sql.DataFrame;
import org.apache.spark.sql.SQLContext;
import org.apache.spark.sql.hive.HiveContext;
import org.datanucleus.api.jdo.JDOPersistenceManagerFactory;
import org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient;
import org.datanucleus.exceptions.NucleusException;

public class RequeteKindiClass{
        public static void main(String[] args) {
        		String request = args[0];
                SparkConf conf = new SparkConf().setAppName("BenchHawk");
                SparkContext sc = new SparkContext(conf);
                HiveContext hiveContext = new org.apache.spark.sql.hive.HiveContext(sc);
                DataFrame df = hiveContext.sql(request);
                df.show();
         }
}
```

**Compile it**
```shell
javac -cp "/usr/hdp_mount/hdp/2.3.4.7-4/spark/lib/*:/usr/hdp_mount/hdp/2.3.2.0-2950/spark/lib/*"  ~/RequeteKindiClass.java
```

**Package it** 
```shell
jar cf BenchmarkHawk.jar ./RequeteKindiClass.class
```

**Run it** 
- Tip 1: If your spark-submit needs some additional jars, you may add some missing jars to your spark submit using --jars option
- Tip 2: You must copy your hive-site.xml to all your workers int /etc/spark/conf

```shell
spark-submit \
--jars /usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-core-3.2.10.jar,/usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-api-jdo-3.2.6.jar,/usr/hdp_mount/hdp/2.3.4.7-4/hive/lib/datanucleus-rdbms-3.2.9.jar \
--class RequeteKindiClass \
--master yarn \
--deploy-mode cluster \
--files /etc/spark/conf/hive-site.xml \
--queue q_datalab \
BenchmarkHawk.jar \
"show databases"

```
