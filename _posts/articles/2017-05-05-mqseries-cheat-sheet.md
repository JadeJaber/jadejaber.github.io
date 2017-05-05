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
## 1. amqmfsck
**amqmfsck** checks whether a shared file system on UNIX and IBM systems meets the requirements for storing the queue manager data of a multi-instance queue manager. 

1. If no option is specified, the program tests the basic behavior of the filesystem for use by WebSphere MQ for queue manager data and logs
```shell
su mqm -c "/opt/mqm/maintenance/8.0.0.3/MQSeriesServer/backup/opt/mqm/bin/amqmfsck /var/opt/data/flat/mqm/qmgrs"
```

2. amqmfsck -c : Test writing concurrently to a file.
```shell
su mqm -c "/opt/mqm/maintenance/8.0.0.3/MQSeriesServer/backup/opt/mqm/bin/amqmfsck -c /var/opt/data/flat/mqm/qmgrs"
```

3.  amqmfsck -w   Test waiting for and releasing file locks.
```shell
su mqm -c "/opt/mqm/maintenance/8.0.0.3/MQSeriesServer/backup/opt/mqm/bin/amqmfsck -wv /var/opt/data/flat/mqm/qmgrs"
```
**!!! Bizarement le fichier lock n'a pas été supprimé et j'ai pu mocké à partir des 2 noeuds, est ce normal ?**

## 2. crtmqm
Use the crtmqm command to create a queue manager and define the default and system objects