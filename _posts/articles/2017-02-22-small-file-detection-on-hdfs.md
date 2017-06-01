---
published: true
layout: post
excerpt: Small file detection on HDFS
categories: articles
tags:
  - hortonworks
  - hadoop
  - storage
  - debug troubleshooting optimization
  - hdfs
---
To determine the existence of small files in the cluster, please do follow below steps.

Hadoop OIV enables administrators to analyze non-human readable hadoop namespace fsimage.

### Some of the processors that help in analyzing the fsimage are
 
1. ls : Similar to lsr command. Consists of directory, permissions, replication, owner group, file size, modification date and path. 

2. Indented : This processor uses indented form organizing the output which contains image version, generation time stamp, node and block details. 
 
3. Delimited : It is a tab delimited processor output which contains details such path, replication, modification time, access time, block size, number of blocks, file size, namespace quota, diskspace quota, permissions, username and group name.
 
4. XML : It is an XML based processor which outputs similar details as that of lsr.

5. FileDistribution: This is a processor that is based on bucketing the files count according to their file sizes. Files that belong to a range of file sizes are grouped together and counted.


### Below is the process that uses ls processor to analyze the count of small files using the OIV.

 
**1.    FSImage download:**

Download the fsimage_####### from the Namenode's dfs.name.dir location.

**2.     Load the FSImage:**

On the node where you copied the FS Image. Run the below commands

OIV processing is a memory heavy operation. Please increase your JVM values based on the size of your FSImage.

At the end of step2, there is a web server that exposes read only WebHDFS API.
```shell
export HADOOP_OPTS=“-Xms<HighValue>m -Xmx<HighValue>m $HADOOP_OPTS"
nohup hdfs oiv -i fsimage_####### -o fsimage_#######.txt &
```

**3.   "ls -R" report generation:**

    nohup hdfs dfs -ls -R webhdfs://127.0.0.1:5978/ > /data/home/hdfs/lsrreport.txt &

**4.   Creating a hive schema for generated report:**

```shell
add jar /usr/hdp/current/hive/lib/hive-contrib.jar;
CREATETABLE lsr (permissions STRING, replication STRING, owner STRING, ownergroup STRING, size STRING, fileaccessdate STRING, time STRING, file_path STRING ) ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe' WITH SERDEPROPERTIES ("input.regex" = "(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(\\S+)\\s+(.*)"); 
load data inpath ‘/data/home/hdfs/lsrreport.txt’ overwrite into table lsr;
create view lsr_view as select (case substr(permissions,1,1) when 'd' then 'dir' else 'file'end) as file_type,owner,cast(size as int) as size, fileaccessdate,time,file_path from lsr;
```

**5. Query to check less than 1MB file.**

```sql
select relative_size,fileaccessdate,file_path as total from (select (case size < 1048576 when true then 'small' else 'large' end) as relative_size,fileaccessdate,file_path from lsr_view where file_type='file') tmp where relative_size='small' limit 100;
```
 
links: [http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsImageViewer.html](http://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/HdfsImageViewer.html)

### Concatenate files in partitions
```sql
ALTER TABLE [table] PARTITION([partition]) CONCATENATE;
ALTER TABLE [table] PARTITION([partition]) CONCATENATE;
````
> Best solution remains to do a select insert to get rid of multiple small files.
