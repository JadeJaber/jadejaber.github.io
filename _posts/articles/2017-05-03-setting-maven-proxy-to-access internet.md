---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - java
  - intellij
  - maven
---
## 1 Maven Proxy setup

If your company uses a proxy to access internet and your artifacts are not available within your company's nexus, you need to download and install [CNTLM](http://cntlm.sourceforge.net/) 

Edit your cntlm.ini file
```ini
Username    [username]
Domain      [domain]
Password    [password]
Proxy       [your proxy]:[port]
Listen      [port number of cntlm]
```

Udate Maven's settings.xml file and configure your proxy

```xml
<proxy>
   <id>optional</id>
   <active>true</active>
   <protocol>http</protocol>
   <host>localhost</host>
   <port>3133</port>
</proxy>
```

You may then launch your cntlm service using the service manager (Windows)

