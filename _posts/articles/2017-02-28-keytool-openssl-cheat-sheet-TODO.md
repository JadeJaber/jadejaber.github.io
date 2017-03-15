---
published: false
layout: post
excerpt: description
categories: articles
share: true
tags:
  - linux
  - cheat sheet
  - security
  - certificates
  - keytool
  - openssl
---
A public/private key may be generated with such a command  : 
```shell
keytool -genkey -keyalg RSA -alias ssl -keystore keystore.jks -validity 360 -storepass changeit -keypass changeit -dname "cn=hostname, ou=test, o=test, c=XX"
```

**Options definitions** :
- keyalg : ###
- alias : The name of your public/private key pair.
- keystore : The store in which your private/public key pair will securiely saved -> It's a safe
- validity : valdity of you public/private key pair
- storepass : password to read/modify/access your keystore
- keypass : Password to access your key pair
- dname : distinguished name associated to your key pair (these info are supposed to identify you as a unique server/person)
