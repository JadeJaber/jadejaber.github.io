---
published: false
layout: post
excerpt: ElasticSearch Cheat Sheet
categories: articles
share: true
tags:
  - NoSQL
  - storage
  - search engine
  - cheat sheet
  - elasticsearch
---
## 1. Introduction
- Data is stored in a schema-less JSON docmuents -> You do not need to define fieds and types before your insert data
- Near-real-time since it's a cluster. An update or an insert must be propagated througout the cluster
- Written in Java -> cross platform


We communicate with ES via its REST API (curl)
```shell
curl -X GET http://localhost:9200/person/employee/123
```

## 2. Terminology
### 2.1 Index 
- A collection of documents (product, account, movie). Each of these elements are a _type_ .
- Similar to a database within a RDBMS
- Identified by names (lowercase)
- Can define as many indexes you want (but most peoaple will have a few of them)


### 2.2 Type
- Represents a class/category of simlar documents (product, account, movie)
- Consists of a name and a mapping (explained later)
- Similar to a table within a RDBMS
- An index can have one or more types defined, each with their own mapping
- stored within a metadata field named _type -> Searching for specific documents types applies a filter on this field

### 2.3 Mapping
- Similar to a database schema for a table in RDBMS
- Describes the data type of fields that a document of a given type may have + information on how fields should be indexed and stored
- Defining a mapping is optional (Dynamic mapping)

### 2.4 Document
- A basic unit of information that can be indexed
- Consists of fields, which are key/value pairs. A value can be a string, date, object...
- Corresponds to an object in OOP
- Documents are expressed in JSON
- Similar to a raw in RDBMS


> An **index** contains **documents** which have **types**. Types are defined by **mappings**.


### 2.5 Shards
- An index can be devided intpo multiple pieces called shards -< Useful when an index contains more data than the hardwware of a node can store
- A shard is a fully functional and independant index
- The number of shards can be specified when creating an index (default = 5)
- Allows to scale horizontally 
- Allows to distribute and parallelize operations across shards -> Increaes performance

### 2.6 Replicas
- A replica is a copy of a shard (default = 1 )
- Provides High Availability in case a shard or node fails
- Allows scaling search volume, because search queries can be executed on all replicas

## 3. Creating an Index

**List all indexes **
```shell
 curl -X GET  http://localhost:9200/_cat/indices?v
 ```
 
**Create in index** 
```shell
curl -X PUT http://localhost:9200/ecommerce -d '{ }'
```



