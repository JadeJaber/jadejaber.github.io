---
published: true
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
## 1. Discover

**Launch CQL client**
```shell
cassandra-2.1.13/bin/cqlsh [hostnmae] -u [user]
```

**List Keyspaces**
```sql
DESCRIBE KEYSPACES;
or
select * from system.schema_keyspaces ;
```

**Change Keyspace**
```sql
USE nom_keyspace;
```

**List tables of a Keyspace**
```sql
describe tables;
```

## 2. Table mangement

**Create table**
```sql
CREATE TABLE 	[Table Name] (
[Field 2] [Type],
[Field 1] [Type])
WITH COMPACT STORAGE;
```
Info : You may add PRIMARY KEY after the type to set a primary key
