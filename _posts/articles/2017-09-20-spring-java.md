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
# Concepts
- Aspect Oriented Programming (AOP)
- Cross-cutting concerns : loggin, security, caching => aspects that are not related to business logic
- Dependency Injection
- Inversion of Control (IoC) is a general concept, and it can be expressed in many different ways. Dependency Injection is merely one concrete example of Inversion of Control.

The key unit of modularity in OOP is the class, whereas in **AOP** the unit of modularity is the aspect. 
**DI** helps you decouple your application objects from each other, while **AOP** helps you decouple **cross-cutting concerns** from the objects that they affect.

# Spring architecture 
https://www.tutorialspoint.com/spring/spring_architecture.htm 

# IoC
The Spring container is at the core of the Spring Framework. **The container will create the objects, wire them together, configure them, and manage their complete life cycle from creation till destruction**. The Spring container uses DI to manage the components that make up an application. These objects are called Spring Beans, which we will discuss in the next chapter.
There are 2 types of containers : 
- Spring BeanFactory Container
- Spring ApplicationContext Container

