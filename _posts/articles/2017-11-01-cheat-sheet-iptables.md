---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - linux
  - security
  - network
---
Export rules
```shell
sudo iptables-save > iptables-export 
```

Import and apply rules (in between you may modify the rules in the file) 
```shell
sudo iptables-restore < /tmp/iptables-export 
```
