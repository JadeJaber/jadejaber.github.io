---
published: true
layout: post
excerpt: Java compilation cheat sheet
categories: articles
share: true
tags:
  - linux
  - hortonworks
  - java
  - compilation
  - cheat sheet
---
### Compile a java script
 ```shell
 javac -cp "/usr/hdp_mount/hdp/2.3.4.7-4/spark/lib/*:/usr/hdp_mount/hdp/2.3.2.0-2950/spark/lib/*"  ~/requeteKindi.java
 ```

### Create your jar
```shell
jar cf BenchmarkHawk.jar ./RequeteKindiClass.class
```

### Find a "not found import"
 
Exemple : 
 
```shell
/root/requeteKindi.java:11: error: cannot find symbol
import org.apache.spark.api.java.function.MapFunction;
```
To find which jar contains your class, you may type on google 

- [class name] mvn repository
- [class name] github

Once you get the jar name, you may check its content using: 
```shell
jar tf [jar file]
```

You may also check all the jars that are on your server using: 

```shell
#if you're looking for org.apache.spark.api.java.function.MapFunction
locate .jar | xargs -n 1 jar tf | grep "org/apache/spark/api/java/function/MapFunction"
```

