---
published: false
layout: post
excerpt: Fix under-replicated block in HDFS
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - HDFS
  - tips
  - under-replicated
---

```shell 
su - <$hdfs_user>
     
bash-4.1$ hdfs fsck / | grep 'Under replicated' | awk -F':' '{print $1}' >> /tmp/under_replicated_files 
     
bash-4.1$ for hdfsfile in `cat /tmp/under_replicated_files`; do echo "Fixing $hdfsfile :" ;  hadoop fs -setrep 3 $hdfsfile; done
```