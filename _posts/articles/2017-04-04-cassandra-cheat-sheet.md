---
published: false
layout: post
excerpt: Cassndra Cheat Sheet
categories: articles
share: true
tags:
  - NoSQL
  - storage
  - database
  - cheat sheet
  - cassandra
---
##Launch CQL client##
```shell
cassandra-2.1.13/bin/cqlsh inbdfcas01 -u cassandra
```

##List Keyspaces##
```sql
DESCRIBE KEYSPACES;
```

##Change Keyspace##
```sql
USE nom_keyspace;
```

##List tables of a Keyspace##
```sql
describe tables;
```