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


We communicate with ES via its REST API (curl)
```shell
curl -X GET http://localhost:9200/person/employee/123
```

Data is stored in a schema-less JSON docmuents -> You do not need to define fieds and types before your insert data
Near-real-time since it's a cluster. An update or an insert must be propagated towards the cluster

