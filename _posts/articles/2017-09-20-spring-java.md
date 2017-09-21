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
[src : http://www.tutorialspoint.com/spring/](http://www.tutorialspoint.com/spring/)

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
- Spring BeanFactory Container (lightweight)
- Spring ApplicationContext Container (includes BeanFactoryContainer + more feature as the ability to resolve textual messages from a properties file and the ability to publish application events to interested event listeners

# Bean Definition
https://www.tutorialspoint.com/spring/spring_bean_definition.htm
Beans' metadata can be defined in JavaCode, Annotations or XML files.

## Scopes
- Singleton
- prototype (= not sigleton)

## Bean Life Cycle
You may set up post instanciation and pre-destroy actions for each object using : 
- init-method and destroy-method using the xml Bean definition file OR
- by implemeting InitializingBean interface (function -> init) and DisposableBean interface (function -> destroy)

## BeanPostProcessor 
BeanPostProcessor lets you define actions to be done on all beans just before init and right after init. Yo uneed to create a separate class which implements the BeanPostProcessor interface and declare that new Class/Bean into your xml configuration file.


## Bean Inheritance
Beans definition can inherit from other beans usinf the "parent" keyword.

