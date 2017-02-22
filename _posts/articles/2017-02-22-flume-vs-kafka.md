---
published: true
layout: post
excerpt: Kafka vs Flume
categories: articles
tags:
  - kafka
  - flume
comments: true
share: true
---
Kafka  and Flume are different products. Kafka is a message broker and sometimes it is called a data base. Whereas _Flume is a distributed, reliable, and available service for efficiently collecting, aggregating, and moving large amounts of log data_ => Flume does not "store" data which is case for Kafka.

|  | Flume | Kafka |
|--------|:-------|:--------|
| Definition   | Flume is a **distributed**, **reliable**, and **available** system for efficiently **collecting**, **aggregating**, and moving **large amounts** of data from **many different sources** to a **centralized data store**, such as HDFS or HBase   | Kafka is a general purpose **publish-subscribe** model **messaging** system, which offers strong **durability**, **scalability** and **fault-tolerance** support.   |
| Integration with Hadoop   | Tightly integrated   | It is not specifically designed for Hadoop. Hadoop ecosystem is just be one of its possible consumers.   |
| Durability   | No Durability (ACID) with a memory channel (vs Disk Channel)   | Yes   |
| Replication   | Not natively. But can be done with RAID disks. | Yes   |
| Scalability   | Adding more consumers to Flume means **changing** the **topology** of Flume pipeline design, replicating the channel to deliver the messages to a new sink. **It requires some down time **   | Very **easy** to **add** large number of **consumers** without affecting performance and **without down time**   |
| Handle Spikes   | Flume sink supports **push** model. When event producers suddenly generate a flood of messages, even though flume channel somewhat acts as a buffer between source and sink, the sink endpoints might still be **overwhelmed** by the write operations   | "**Shock absorber**" between the producers and consumers   |
| Consumption model   | cd previous cell   | Because Kafka consumers **pull** data from the topic, different consumers can consume the messages at **different pace**. Kafka also supports different consumption model. You can have one consumer processing the messages at **real-time** and another consumer processing the messages in **batch** mode.   |
| Connectors   | The key benefit of Flume is that it supports many built-in **sources and sinks**, which you can use **out of box**   | If you use Kafka, most likely you have to write your own producer and consumer. Of course, as Kakfa becomes more and more popular, other frameworks are constantly adding integration support for Kafka.   |
| Data processing/filtering   | In contrast, Flume supports different data flow models and interceptors chaining, which makes event filtering and transforming very easy. For example, you can filter out messages that you are not interested in the pipeline first before sending it through the network for obvious performance reason   | Kafka does not provider native support for message processing. So mostly likely it needs to integrate with other event processing frameworks such as Apache Storm to complete the job   |
{: .table}
