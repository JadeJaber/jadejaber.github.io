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
[http://bencane.com/2013/04/22/websphere-mq-cheat-sheet-for-system-administrators/](http://bencane.com/2013/04/22/websphere-mq-cheat-sheet-for-system-administrators/)

## Definitions 

### Queue VS Topic

**Queue**:

 - Point-to-point model.
 - Only one consumer gets the message.
 - Messages have to be delivered in the order sent.
 - A JMS queue only guarantees that each message is processed only once.
 - The Queue knows who the consumer or the JMS client is. The destination is known.
 - The JMS client (the consumer) does not have to be  active or connected to the queue all the time to receive or read the message.
 - Every message successfully processed is acknowledged by the consumer.

**Topic**:

 - Publish/subscribe model.
 - Multiple clients subscribe to the message.
 - There is no guarantee messages have to be delivered in the order sent.
 - There is no guarantees that each message is processed only once.As this can be sensed from the model.
 - The Topic, have multiple subscribers and there is a chance that the topic does not know all the subscribers. The destination is unknown.
 - The subscriber / JMS client needs to the active when the messages are produced by the producer, unless the subscription was a durable subscription.
 - No, Every message successfully processed is not acknowledged by the consumer/subscriber.

### Types of queue
src : [https://www.ibm.com/support/knowledgecenter/SSFKSJ_7.0.1/com.ibm.mq.csqzal.doc/fg10950_.htm](https://www.ibm.com/support/knowledgecenter/SSFKSJ_7.0.1/com.ibm.mq.csqzal.doc/fg10950_.htm)

#### Local and remote queues
A queue is known to a program as local if it is owned by the queue manager to which the program is connected; the queue is known as remote if it is owned by a different queue manager. The important difference between these two types of queue is that you can get messages only from local queues. (You can put messages on both types of queue.)

The queue definition object, created when you define a local queue, holds the definition information of the queue as well as the physical messages put on the queue. The queue definition object, created when you define a remote queue, only holds the information necessary for the local queue manager to locate the queue to which you want your message to go. This object is known as the local definition of a remote queue. All the attributes of the remote queue are held by the queue manager that owns it, because it is a local queue to that queue manager.

#### Alias queues
To your program, an alias queue appears to be a queue, but it is really a WebSphere MQ object that you can use to access another queue or a topic. This means that more than one program can work with the same queue, accessing it using different names.

#### Cluster queues
A cluster queue is a queue that is hosted by a cluster queue manager and made available to other queue managers in the cluster.

The cluster queue manager makes a local queue definition for the queue specifying the name of the cluster that the queue is to be available in. This definition has the effect of advertising the queue to the other queue managers in the cluster. The other queue managers in the cluster can put messages to a cluster queue without needing a corresponding remote-queue definition. A cluster queue can be advertised in more than one cluster.

## Commands

### 1. amqmfsck : File system Check
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

### 2. crtmqm : Create Queue Manager
Use the crtmqm command to create a queue manager and define the default and system objects

```shell
-q Makes this queue manager the default queue manager. 
-ld The directory used to store log files. 
-md The directory used to hold the data files for a queue manager
-d The name of the local transmission queue where remote messages are put if a transmission queue is not explicitly defined for their destination. There is no default.

./crtmqm -ld /var/opt/data/flat/mqm/qmgrs/logs -md /var/opt/data/flat/mqm/qmgrs/data  -d DEFAULT.XMIT.QUEUE -ll -q QM_TESTJADE
```

### 3. dspmq : List Queue Managers
```shell
./dspmq
```

### 4. strmqm : Start Queue Manager
```shell
-x Start an instance of a multi-instance queue manager on the local server, permitting it to be highly available. If an instance of the queue manager is not already running elsewhere, the queue manager starts and the instance becomes active. The active instance is ready to accept local and remote connections to the queue manager on the local server.

If a multi-instance queue manager instance is already active on a different server the new instance becomes a standby, permitting it to takeover from the active queue manager instance. While it is in standby, it cannot accept local or remote connections.

You must not start a second instance of a queue manager on the same server. 

./strmqm -x QM_TESTJADE
```

### 5. runmqsc : Create Local Queues

Use the runmqsc command to issue MQSC commands to a queue manager. MQSC commands enable you to perform administration tasks. For example, you can define, alter, or delete a local queue object.
```shell
#Start the prompt
./runmqsc [QMANAGER] 
# 
DEFINE CHANNEL(CHNL_PILCOM) CHLTYPE(SVRCONN) TRPTYPE(TCP) MCAUSER('mqm')
```


### Il faut reprendre à partir de la création des QLOCAL (à partir du mail d'Anis) et comprendre la création du channel, du listener et des QLOCAL sui sont configurées en tant que "transmission queue" (USAGE(XMITQ)) (https://www.ibm.com/support/knowledgecenter/en/SSFKSJ_9.0.0/com.ibm.mq.ref.adm.doc/q083460_.htm) 
./runmqsc QM_PILCOM
DEFINE CHANNEL(CHNL_PILCOM) CHLTYPE(SVRCONN) TRPTYPE(TCP) MCAUSER('mqm')
DEFINE LISTENER(LSNR_PILCOM) TRPTYPE(TCP) PORT(1414)
DEFINE QLOCAL('PilcomErdvQueue') DEFPSIST(YES) STATQ(ON) USAGE(XMITQ) DESCR('Queue Pour WS ERDV')
DEFINE QLOCAL('PilcomSoftQueue') DEFPSIST(YES) STATQ(ON) USAGE(XMITQ) DESCR('Queue Pour WS SOFT')
DEFINE QLOCAL('PilcomAGCQueue') DEFPSIST(YES) STATQ(ON) USAGE(XMITQ) DESCR('Queue Pour WS AGC')
DEFINE QLOCAL('PilcomPOCDQueue') DEFPSIST(YES) STATQ(ON) USAGE(XMITQ) DESCR('Queue Pour WS POCD')
DEFINE QLOCAL('PilcomGRVQueue') DEFPSIST(YES) STATQ(ON) USAGE(XMITQ) DESCR('Queue Pour WS GRV')
START LISTENER(LSNR_PILCOM)
START CHANNEL(CHNL_PILCOM)
end
