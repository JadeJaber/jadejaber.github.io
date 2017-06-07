---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - hortonworks
  - hadoop
  - hive
  - JDBC
  - DBVisualizer
  - thriftServer
---
[Connecting DbVisualizer and DataGrip to Hive with Kerberos enabled](https://community.hortonworks.com/articles/73458/connecting-dbvisualizer-and-datagrip-to-hive-with.html)

> Your thrift server may be SparkThriftServer or Hiveserver2

| Prérequisites | Direct connexion | Via  a proxy (VPN) |
|--------|:-------|:--------|
| 1. The thriftserver but be reachable through the proxy | N | Y |
| 2. Kerberos server must be reachable  through the proxy | N | Y |
| 3. Add the following parameter to DbVisualizer in DBViz Tools > Tools Properties > General > Specify overriden Java VM properties
-Djavax.security.auth.useSubjectCredsOnly=false
| Y | Y |
| 4. Create a environment varaible KRB5CCNAME = c:\tmp\CCCACHE | N | Y |
| 5. The kinit mustr be done with the java used by DbVisualizer| Y | Y |
| 6. Add -A option to your Kinit | N | Y |
| 7. The krb5.ini file must be in c:/Windows | Y | Y |
| 8. Specify the correct hostnames in the krb5.conf. And the defautl REALM ( default_realm) should be the one used for your cluster | Y | Y |
| 9. Get TimeVeil JDBC Driver : https://github.com/timveil/hive-jdbc-uber-jar/releases | Y | Y |
| 10. You must kinit before opening de DBViz| Y | Y  |



**JDBC connexion chain :**
- Transport Mode = Binary : jdbc:hive2://[FQDN serveur Thrift]:[PORT]/default;principal=hive/[FQDN serveur Thrift]@[REALM]
- Transport Mode = HTTP : jdbc:hive2://[FQDN serveur Thrift]:[PORT]/default;principal=hive/[FQDN serveur Thrift]@[REALM];httpPath=cliservice;transportMode=http






