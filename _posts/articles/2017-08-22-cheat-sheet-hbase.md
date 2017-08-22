---
published: true
layout: post
categories: articles
share: true
tags:
  - cheat sheet
  - hbase
  - hadoop
  - nosql
---
# Locate snapshot files
```shell
hbase org.apache.hadoop.hbase.snapshot.SnapshotInfo -snapshot [snapshot] -files
```
