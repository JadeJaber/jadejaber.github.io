---
published: true
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
- An index can be devided intpo multiple pieces called shards -> Useful when an index contains more data than the hardwware of a node can store
- A shard is a fully functional and independant index
- The number of shards can be specified when creating an index (default = 5)
- Allows to scale horizontally 
- Allows to distribute and parallelize operations across shards -> Increaes performance

### 2.6 Replicas
- A replica is a copy of a shard (default = 1 )
- Provides High Availability in case a shard or node fails
- Allows scaling search volume, because search queries can be executed on all replicas

## 3. Creating/Deleting an Index

**List all indexes**
```shell
curl -X GET  http://localhost:9200/_cat/indices?v
```
 
**Create in index** 
```shell
curl -X PUT http://localhost:9200/ecommerce -d '{ }'
```
**Note:** If you insert a document without defining an index, ES will automatically create an index.
 
**Delete in index"**
```shell
curl -X DELETE http://localhost:9200/ecommerce
```

## 4. Adding mappings
```shell
curl -X PUT http://localhost:9200/ecommerce -d '
{
	"mappings": {
		"product": {
			"properties": {
				"name": {
					"type": "string"
				},
				"price": {
					"type": "double"
				},
				"description": {
					"type": "string"	
				},
				"status": {
					"type": "string" 
				},
				"quantity": {
					"type": "integer"
				},
				"categories": {
					"type": "nested",
					"properties": {
						"name": {
							"type": "string"
						}
					}
				},
				"tags": {
					"type": "string"
				}
			}
		}
		
	}
}'
```
**Note:** We cannot add mappings to existing Data. 

## 4. Documents
### 4.1 Adding documents
```shell
curl -X POST http://localhost:9200/ecommerce/product/1001 -d '
{
	"name": "Zend framework",
	"price": 30.00,
	"description": "Learn Zend framwork infew hours",
	"status": "active",
	"quantity": 1,
	"categories": [
		{ "name": "Software"}
	],
	"tags": ["zendframework", "php", "progeamming", "zd2"]
}' 
```
**Note:** Providing an ID is optional. If not provided ES will generate an ID

### 4.2 Replacing documents
Replacing documents is done with the same request as adding a document when specifying the ID.

```shell
curl -X POST http://localhost:9200/ecommerce/product/1001 -d '
{
	"name": "Zend framework 2",
	"price": **40.00**,
	"description": "Learn Zend framwork infew hours",
	"status": "active",
	"quantity": 1,
	"categories": [
		{ "name": "Software"}
	],
	"tags": ["zendframework", "php", "progeamming", "zd2"]
}' 
```

### 4.3 Updating documents
Updating a doucment lets you add/remove or modify a single field without providing all the information as when we replaced the document.
```shell
curl -X POST http://localhost:9200/ecommerce/product/1001/_update -d '
{
	"doc": {
		"price": 50.00
	}
}' 
```

### 4.4 Deleting documents
```shell
curl -X DELETE http://localhost:9200/ecommerce/product/1001
```
**Note:** Basically, we may only delete documents by ID but there is plugin "DeleteByQuery" that lets you delete by query.

### 4.5 Requesting a document
```shell
curl http://localhost:9200/ecommerce/product/1003
```

## 5. Batch processing
> Batch processing with bulk limits the amount of network overhead as it will need a unique network round trip.

You need to edit a file with the content of your bulk : vi ./requests
```json
{"index":{"_id":"1002"}}
{"name": "Zendtest framework","price": 40.00,"description": "Leran Zend framwork infew hours","status": "active","quantity": 1,"categories": [{ "name": "Software"}],"tags": ["zendframework", "php", "progeamming", "zd2"]}
{"index":{"_id":"1003"}}
{"name": "Zendtest2 framework","price": 40.00,"description": "Leran Zend framwork infew hours","status": "active","quantity": 1,"categories": [{ "name": "Software"}],"tags": ["zendframework", "php", "progeamming", "zd2"]}
```
And then call the _bulk API with reference to your file

```shell
curl -X POST http://localhost:9200/ecommerce/product/_bulk --data-binary "@requests"
```

You may also DELETE or UPDATE documents using the _bulk API
```json
{ "delete":{"_id":"1002" } }
{ "update":{"_id":"1003" } }
{ "doc": { "quantity" : 33 } }
```
**Note:** If you need to bulk actions on several type or indexes you may omit them in the API call and specify them in your jsons
```shell
curl -X POST http://localhost:9200/_bulk --data-binary "@requests"
```
```json
{ "update":{"_id":"1003", "_index" : "ecommerce", "_type" : "product" } }
{ "doc": { "quantity" : 33 } }
```
**Note:** If an action fails, the remaining actions will still be executed. We have an action in the returned json wich lets us identify the errors.


## 6. Searching with Elastic

### 6.1. Relevancy & Scoring
- A **score** is calculated for each documents that matches a query (This higher the score, the more relevant the document is)
- Queries in **query context** affect the scores of matching documents (_How well does the document match ?_)
- Queries in **filter context** do not affect the scores of matching documents (_Does the docuiment match ?_)

### 6.2. Query String
**All fields are searched.**
```shell
curl -X POST http://localhost:9200/ecommerce/product/_search?q=pasta
```

**You may specify a field**
```shell
curl -X POST http://localhost:9200/ecommerce/product/_search?q=name:pasta
```

**You may add some logical operators**
```shell
curl -X POST http://localhost:9200/ecommerce/product/_search?q=name:(pasta AND spaghetti)
curl -X POST http://localhost:9200/ecommerce/product/_search?q=(name:(pasta OR spaghetti) AND status:active)
```
Adding a "+" before a statement means that the word must be present
Adding a "-" before a statement means that the word must NOT be present
```shell
curl -X POST http://localhost:9200/ecommerce/product/_search?q=name:+pasta -spaghetti
```

**Phrase search**


### 6.3. Query DSL
Search by defining queries within the request body JSON
Supports more features than the query string approach

```shell
curl -X POST http://localhost:9200/ecommerce/product/_search -d '
{
	"query": {
    	"match": {
        	"name": zend
        }
    }    
}' 
```




