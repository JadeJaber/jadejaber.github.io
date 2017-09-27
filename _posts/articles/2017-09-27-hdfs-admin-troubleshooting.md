---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - HDFS
  - debug troubleshooting
---
### Display global report 

```shell
hdfs fsck / 

......................Status: HEALTHY
 Total size:    430929 B
 Total dirs:    14
 Total files:   22
 Total symlinks:                0
 Total blocks (validated):      22 (avg. block size 19587 B)
 Minimally replicated blocks:   22 (100.0 %)
 Over-replicated blocks:        0 (0.0 %)
 Under-replicated blocks:       0 (0.0 %)
 Mis-replicated blocks:         0 (0.0 %)
 Default replication factor:    3
 Average block replication:     3.090909
 Corrupt blocks:                0
 Missing replicas:              0 (0.0 %)
 DecommissioningReplicas:       2
 Number of data-nodes:          47
 Number of racks:               1
FSCK ended at Wed Sep 27 10:04:28 CEST 2017 in 2 milliseconds
The filesystem under path '/' is HEALTHY
```

