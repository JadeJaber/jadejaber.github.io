---
published: true
layout: post
excerpt: Linux - How to use the information in proc for troubleshooting
categories: articles
tags:
  - linux
  - troubleshooting
share: true
title: Linux - Troubleshoot using proc
---
In Linux OS,  '/proc' is a virtual filesystem which doesn't contain real files but runtime system information.

Some of the files under /proc/PID/ (Process ID) are helpful to investigate process related issues.

## Common ways of finding a PID are:

```shell
ps aux (or -elf) | grep -i some_program_name

lsof -nPi:some_port_number

check pid file under /var/run/program_name/
```


## Common files which would be helpful to investigate an issue:

**1. /proc/PID/ulimits**

'ulimits' shows all limits set for the specified PID.

Checking this file would be useful when issue might be misconfigured or unset of some particular limit

**2. /proc/PID/io**

By checking numbers in this file a couple of times periodically would be useful to check if this process is actually reading/writing or not and if it's busy due to I/O
[More detail](http://docs.1h.com/Proc_I/O_Explained)

**3. /proc/PID/environ**

This shows environment variable set to this process.
Especially useful to check Java process's actual CLASSPATH variable

```shell
cat /proc/PID/environ | tr '\0' '\n'
```

Above shows the values with nicer format, for example:

```shell
[root@node2 ~]# cat /proc/5670/environ | tr '\0' '\n' | grep ^CLASSPATH
CLASSPATH=/etc/hadoop/conf:/usr/hdp/2.2.6.0-2800/hadoop/lib/*:/usr/hdp/2.2.6.0-2800/hadoop/.//*:/usr/hdp/2.2.6.0-2800/hadoop-hdfs/./:/usr/hdp/2.2.6.0-2800/hadoop-hdfs/lib/*:/usr/hdp/2.2.6.0-2800/hadoop-hdfs/.//*:/usr/hdp/2.2.6.0-2800/hadoop-yarn/lib/*:/usr/hdp/2.2.6.0-2800/hadoop-yarn/.//*:/usr/hdp/2.2.6.0-2800/hadoop-mapreduce/lib/*:/usr/hdp/2.2.6.0-2800/hadoop-mapreduce/.//*::/usr/share/java/mysql-connector-java-5.1.17.jar:/usr/share/java/mysql-connector-java.jar:/usr/hdp/current/hadoop-mapreduce-client/*:/usr/hdp/current/tez-client/*:/usr/hdp/current/tez-client/lib/*:/etc/tez/conf/:/usr/hdp/2.2.6.0-28...
```

**4. /proc/PID/fd**

'fd' is a directory which contains links to actual files.

This is useful to check which file is actually used for this process (can do same with 'lsof'), and to check how many file descriptor has been used.

For example:
```shell
[root@node2 ~]# ls -l /proc/5670/fd | grep hadoop-common
lr-x------ 1 mapred hadoop 64 Sep  8 08:32 79 -> /usr/hdp/2.2.6.0-2800/hadoop/hadoop-common-2.6.0.2.2.6.0-2800-tests.jar
lr-x------ 1 mapred hadoop 64 Sep  8 08:32 83 -> /usr/hdp/2.2.6.0-2800/hadoop/hadoop-common-2.6.0.2.2.6.0-2800.jar
[root@node2 ~]# ls -l /proc/5670/fd | wc -l
382
```
**5. /proc/PID/status**

This file contains the specified PID's overview status which contains memory usage
