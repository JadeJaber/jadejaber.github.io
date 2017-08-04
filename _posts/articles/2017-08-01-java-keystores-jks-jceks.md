---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - java
  - security
  - certificates
  - keystore
---
# 1 Some theory

**JKS**, Java Key Store. You can find this file at sun.security.provider.JavaKeyStore. This keystore is Java specific, it usually has an extension of jks. This type of keystore can contain private keys and certificates, but it cannot be used to store secret keys. Since it's a Java specific keystore, so it cannot be used in other programming languages. The private keys stored in JKS cannot be extracted in Java.
JCEKS, JCE key store(Java Cryptography Extension KeyStore). It is a super set of JKS with more algorithms supported. It is an enhanced standard added later by Sun. You can find this file at com.sun.crypto.provider.JceKeyStore. This keystore has an extension of jceks. The entries which can be put in the JCEKS keystore are private keys, secret keys and certificates. This keystore provides much stronger protection for stored private keys by using Triple DES encryption.
The provider of JCEKS is SunJCE, it was introduced in Java 1.4. Hence prior to Java 1.4, only JKS can be used.

# 2 Some commands for JCEKS

How to get a password for keytsore using JCEKS as a provider. Follow the following procedure to get the password for your keystore, if it uses JCEKS as a password provider:
 
1. Get The list of aliases in the jceks file using hadoop credential
'''shell
hadoop credential list -provider jceks://file</root/path/to/jceks/file>

hadoop credential list -provider jceks://file/etc/ranger/admin/rangeradmin.jceks

bash-4.1$ hadoop credential list -provider jceks://file/etc/ranger/admin/rangeradmin.jceks
Listing aliases for CredentialProvider: jceks://file/etc/ranger/admin/rangeradmin.jceks
rangeradmin
'''  
 
2. Use the ranger credential API to get the password of the corresponding alias
'''shell
java -cp "/usr/hdp/current/ranger-admin/cred/lib/*" org.apache.ranger.credentialapi.buildks get "yourAlias" -provider jceks://file</root/path/to/jceks/file>
java -cp "/usr/hdp/current/ranger-admin/cred/lib/*" org.apache.ranger.credentialapi.buildks get "rangeradmin" -provider jceks://file/etc/ranger/admin/rangeradmin.jceks
'''