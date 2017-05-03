---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - java
  - intellij
---
## 1. Maven

## Proxy setup

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
Create a settings file settings.xml on the specified folder and configure your proxy

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

