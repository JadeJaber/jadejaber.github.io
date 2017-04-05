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
- Java - cross paltform


We communicate with ES via its REST API (curl)
```shell
curl -X GET http://localhost:9200/person/employee/123
```

## 2. Terminology
### 2.1 Index 
- A collection of documents (product, account, movie). Each of these elements are a _type_ .
- Corresponds to a database within a RDBMS
- Identified by names (lowercase)
- Can define as many indexes you want (but most peoaple will have a few of them)


### 2.2 Type
- Represents a class/category of simlar documents (product, account, movie
- Consists of a name and a mapping (explained later)
- Compared to a table within a RDBMS
- An index can have one or more types defined, each with their own mapping
- stored within a metadata field named _type -> Searching for specific documents types applies a filter on this field







