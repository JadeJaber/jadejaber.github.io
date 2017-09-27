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

### Display files, their blocks name and replication factor

```shell
hdfs fsck /tmp/ -blocks -files

/tmp/myfile 1686 bytes, 1 block(s):
OK
0. BP-1132991310-255.1.1.1-1443607933266:blk_1907772515_134126362 len=1686 repl=3
```
### Display files, their blocks name, replication factor and locations
```shell
hdfs fsck /tmp/ -blocks -files -locations

/tmp/myfile 13431 bytes, 1 block(s):  OK
0. BP-1132991310-184.10.21.11-14436054647226:blk_12070483_1334327 len=13431 repl=3 [
DatanodeInfoWithStorage[255.10.16.69:1019,DS-bf3a1f-dd5e-4a5f-8e7a-c93332974,DISK],
DatanodeInfoWithStorage[255.10.16.49:1019,DS-c03e9-1315-4573-a867-68b726ae1,DISK], 
DatanodeInfoWithStorage[255.10.16.47:1019,DS-d3f85392-34bf-4156-93ef-c47e661d,DISK]
]
```

### List corrupted file
```shell
hdfs fsck /tmp -list-corruptfileblocks
```

### Include file opened for wrrite
```shell 
hdfs fsck /tmp -openforwrite
```

### Display 
1. Datanodes heart beating with Namenode
2. Blocks waiting to be replicated
3. Blocks currently being replicated
4. Blocks waiting to be deleted

```shell 
hdfs dfsadmin -metasave filename
```