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

## Bean template
You may create Bean Teamplates into the XML conf file. Bean templates may be used by Bean templates using the parent keyword.
Bean template should not have classes and should be declared as templates using the abstract = "true" keyword.

## Dependency injection
Dependency injection can be made in 2 ways : 
### Constructor-based Dependency Injection
With contructor-based DI, you need to : 
1. Pass as an argument the dependency to the contructor and set the arguement in the contructor. Here we have passed the SpellChecker dependency into the TextEditor contructor
```java
   public TextEditor(SpellChecker spellChecker) {
      System.out.println("Inside TextEditor constructor." );
      this.spellChecker = spellChecker;
   }
   public void spellCheck() {
      spellChecker.checkSpelling();
   }
```
2. In the XML metada conf file, you need to link the dependecies using the ref keyword
```xml
   <bean id = "textEditor" class = "com.tutorialspoint.TextEditor">
      <constructor-arg ref = "spellChecker"/>
   </bean>
   <!-- Definition for spellChecker bean -->
   <bean id = "spellChecker" class = "com.tutorialspoint.SpellChecker"></bean>
```
> In this case, we did not need a _setter_.

You may also pass simple types to you constructor and specify the type. In that case you use the _value_ keyword instead of _ref_. Be careful the order of the contructor-arg should match the one of the constructor.
```xml
   <bean id = "exampleBean" class = "examples.ExampleBean">
      <constructor-arg type = "int" value = "2001"/>
      <constructor-arg type = "java.lang.String" value = "Zara"/>
   </bean>
```

You may also use index : 
```xml
   <bean id = "exampleBean" class = "examples.ExampleBean">
      <constructor-arg index = "0" value = "2001"/>
      <constructor-arg index = "1" value = "Zara"/>
   </bean>
```

### Spring Setter-based Dependency Injection
With Setter based DI, you need to  : 
1. Create a setter and a getter in your class to set the dependcy
```java
    public void setSpellChecker(SpellChecker SpellChecker) {
        this.spellChecker=SpellChecker;
        System.out.println("Inside setter");
    }
    public SpellChecker getSpellChecker() {
        return spellChecker;
    }
```
2. And replace the _contructor-arg_ tag with a _property_ tag
```xml
    <bean id = "textEditor" class = "com.jadejaberdi.TextEditor">
        <property name="spellChecker" ref="spellChecker" />
    </bean>
    <bean id="spellChecker" class="com.jadejaberdi.SpellChecker" />
```
> In this case we did not need to set a _constructor_

### Inner beans
Beans can be encapsulated in each other, no need to use the _ref_ keyword in that case:
```xml
   <bean id = "textEditor" class = "com.jadejaberdi.TextEditor">
      <property name = "spellChecker">
         <bean id = "spellChecker" class = "com.jadejaberdi.SpellChecker"/>
      </property>
   </bean>
```

### p-namespace
The above xml tag can be shorter (usefull when you have many setters) written as follow using namespaces :
```xml
...
      xmlns:p = "http://www.springframework.org/schema/p"
...
    <bean id = "textEditor" class = "com.jadejaberdi.TextEditor" p:spellChecker-ref="spellChecker" />  
    <bean id="spellChecker" class="com.jadejaberdi.SpellChecker" />
```
> Here, you should note the difference in specifying primitive values and object references with p-namespace. The -ref part indicates that this is not a straight value but rather a reference to another bean.

### Beans Auto-Wiring
Auto wiring lets Spring detect the dependencies with the same name/type in the XML file. Yo do not need to add _contructor-ref_ or _properties_ tags in that case.
```xml
    <bean id = "textEditor" class = "com.jadejaberdi.TextEditor" autowire="byName" />
    <bean id="spellChecker" class="com.jadejaberdi.SpellChecker" />
```

## Spring annotations
### @Required
The required annoation is applied to bean property setter methods. It **will force** you to define the attribute value in the beans xml file.
```java
...
import org.springframework.beans.factory.annotation.Required;
...
@Required
public void setName (String name) {
  this.name=name;
}
```
```xml
<bean id="student" class="com.jadejabersa.Student" >
  <property name="name" value="jade" />
</bean>
```

### @Autowired
The @Autowired annotation can apply to bean property setter methods, non-setter methods, constructor and properties.
#### @Autowired on Setter Methods
Autowiring a setter method spares specifying the autowire tag in the beans xml file.
```java
@Autowired
public void setSpellChecker(SpellChecker SpellChecker) {
  this.spellChecker=SpellChecker;
  System.out.println("Inside setter");
}
```

#### @Autowired on Properties
Autowiring an attribute spares creating a setter. Spring will automatically assign those properties with the passed values or references.
```java
@Autowired
private SpellChecker spellChecker;
```
```xml
<bean id = "textEditor" class = "com.jadejaberdi.TextEditor"  />
<bean id="spellChecker" class="com.jadejaberdi.SpellChecker" />
```

#### @Autowired on Constructors 
Autowiring consutructors indicates that the constructor should be autowired when creating the bean, even if no <constructor-arg> elements are used while configuring the bean in XML file. 
```java
   @Autowired
   public TextEditor(SpellChecker spellChecker){
      System.out.println("Inside TextEditor constructor." );
      this.spellChecker = spellChecker;
   }
```
```xml
<bean id = "textEditor" class = "com.tutorialspoint.TextEditor"></bean>
<bean id = "spellChecker" class = "com.tutorialspoint.SpellChecker"></bean>
```

### @Qualifier

### JSR-250 Annotations

