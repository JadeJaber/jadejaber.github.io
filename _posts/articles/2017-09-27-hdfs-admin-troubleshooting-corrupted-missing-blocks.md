---
published: true
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
### Note 
When the bellow commands do not display the blocks/files that are corrupted/missing... you may find more info in the namenode and datanode logs.
You may find in the namenode log the block info and in the datanode the replica info.

### Display missing blocks for a file or under-replicated blocks
```shell
hdfs fsck / [-openforwrite] | egrep -v '^\.+$' 

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

### Display detailed report about block replication & deletion
1. Datanodes heart beating with Namenode
2. Blocks waiting to be replicated
3. Blocks currently being replicated
4. Blocks waiting to be deleted

```shell 
hdfs dfsadmin -metasave filename
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

### Display file related to block
```shell
hdfs fsck -blockId <block_id>
```

### Some theory 
[http://blog.cloudera.com/blog/2015/02/understanding-hdfs-recovery-processes-part-1/](http://blog.cloudera.com/blog/2015/02/understanding-hdfs-recovery-processes-part-1/)

**lease recovery** : Before a client can write an HDFS file, it must obtain a lease, which is essentially a lock. This ensures the single-writer semantics. The lease must be renewed within a predefined period of time if the client wishes to keep writing. If a lease is not explicitly renewed or the client holding it dies, then it will expire. When this happens, HDFS will close the file and release the lease on behalf of the client so that other clients can write to the file.
```shell
hdfs debug recoverLease -path <path> [-retries <num-retries>]
```

**block recovery** : Before lease recovery causes the file to be closed, it’s necessary to ensure that all replicas of the last block have the same length; this process is known as block recovery. Block recovery is only triggered during the lease recovery process, and lease recovery only triggers block recovery on the last block of a file if that block is not in COMPLETE state

**pipeline recovery** : During write pipeline operations, some DataNodes in the pipeline may fail. When this happens, the underlying write operations can’t just fail. Instead, HDFS will try to recover from the error to allow the pipeline to keep going and the client to continue to write to the file.


