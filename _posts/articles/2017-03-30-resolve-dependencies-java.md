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



## Find the appropriate groupId/artifactId of a specific dependency

Maven lets you download all the needed dependencies.
If you need the following classe for instance
```java
import org.apache.hadoop.security.UserGroupInformation;
```

You need first to find the corresponding groupId (org.apache.hive) and the artifacatId (hive-jdbc)

**It may be tricky to find the proper artifactId. As you may see the artifactId hadoop-common is the one that contains the org.apache.hadoop.security package.**

You may use the following tool : [http://search.maven.org/#advancedsearch](http://search.maven.org/#advancedsearch)

Or type on google :
- [class name] mvn repository
- [class name] github


To look for a specific class on your FS: 

```shell
#if you're looking for org.apache.spark.api.java.function.MapFunction
locate .jar | xargs -n 1 jar tf | grep "org/apache/spark/api/java/function/MapFunction"
```
