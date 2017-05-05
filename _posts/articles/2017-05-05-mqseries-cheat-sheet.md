---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - cheat sheet
  - mqseries
  - ibm
  - message broker
---
## 1. amqmfsck : File system Check
**amqmfsck** checks whether a shared file system on UNIX and IBM systems meets the requirements for storing the queue manager data of a multi-instance queue manager. 

1. If no option is specified, the program tests the basic behavior of the filesystem for use by WebSphere MQ for queue manager data and logs
```shell
amqmfsck /var/opt/data/flat/mqm/qmgrs
```

2. amqmfsck -c : Test writing concurrently to a file.
```shell
amqmfsck -c /var/opt/data/flat/mqm/qmgrs
```

3.  amqmfsck -w   Test waiting for and releasing file locks.
```shell
amqmfsck -wv /var/opt/data/flat/mqm/qmgrs
```
**!!! Bizarement le fichier lock n'a pas été supprimé et j'ai pu mocké à partir des 2 noeuds, est ce normal ?**

## 2. crtmqm : Create Queue Manager
Use the crtmqm command to create a queue manager and define the default and system objects

```shell
-q Makes this queue manager the default queue manager. 
-ld The directory used to store log files. 
-md The directory used to hold the data files for a queue manager
-d The name of the local transmission queue where remote messages are put if a transmission queue is not explicitly defined for their destination. There is no default.

./crtmqm -ld /var/opt/data/flat/mqm/qmgrs/logs -md /var/opt/data/flat/mqm/qmgrs/data  -d DEFAULT.XMIT.QUEUE -ll -q QM_TESTJADE
```

## 3. List Queue Managers
./dspmq



