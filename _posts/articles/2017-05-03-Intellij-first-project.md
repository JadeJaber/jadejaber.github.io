---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - ENVIRONNEMENT EDITEUR
  - linux
  - hortonworks
  - hadoop
  - NoSQL
  - LIBRARY
  - spark streaming
  - spark SQL
  - spark ML/MlLib
  - panda
  - scikit learn
  - pySpark
  - kafka streaming
  - kafka connect
  - shell
  - LANGAGE
  - java
  - python
  - spark
  - scala
  - hive
  - pig
  - ROLE
  - execution engine
  - data visualization
  - storage
  - machine learning
  - data processing
  - database
  - streaming
  - compression
  - proxy
  - data ingestion
  - search engine
  - resource manager
  - cluster manager
  - SUBJECT
  - benchmark
  - tips
  - cheat sheet
  - debug troubleshooting
  - optimization
  - security
  - network
  - certificates
  - architecture theory
  - api
  - MACHINE LEARNING
  - logistic regression
  - linear regression
  - deep learning
  - neuronal networks
  - statistics
  - SOLUTION
---
## 1. Maven

1. Create a maven poject

2. Proxy setup
If your company uses a proxy to access internet, you need to download [CNTLM](http://cntlm.sourceforge.net/) 

Edit your cntlm.ini file
```ini
Username    [username]
Domain      [domain]
Password    [password]
Proxy       [your proxy]:[port]
Listen      [port number of cntlm]
```

Go to File > Default Settings > Other Settings > Maven > User Settings File
Create a settings file on the specified folder and configure your proxy

```shell
<proxy>
   <id>optional</id>
   <active>true</active>
   <protocol>http</protocol>
   <host>localhost</host>
   <port>3133</port>
</proxy>
```



