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

## 2. Create

**Create Keyspace**
```sql
CREATE KEYSPACE Keyspace Name] 
WITH REPLICATION = {‘class’:’SimpleStrategy’, 
				‘replication_factor’ : 3 };
```

**Create table**
```sql
CREATE TABLE 	[Table Name] (
[Field 2] [Type],
[Field 1] [Type])
WITH COMPACT STORAGE;
```
**Info :** You may add PRIMARY KEY after the type to set a primary key


**Multi field primary key**
```sql
CREATE TABLE 	[Table Name] (
[Field 2] [Type],
[Field 1] [Type])
PRIMARY KEY (Field1, Field2));
```
**Info :** The field order is important: 
- First column is the partition key
- Second column is the cluster

You may have partition key or clusters with many fields 
```sql
PRIMARY KEY (([Field 1],[Field 2]), ([Field 3],[Field 4]))
```

## 3. Insert and Update

**Insert a new record**
```sql
INSERT INTO [Table] ([Fields list]) VALUES ([Values List);
```
**Info :** Use simple quotes for the values
	
**Update a record**
```sql
UPDATE [Table]] set [Field] = [Value]
```








