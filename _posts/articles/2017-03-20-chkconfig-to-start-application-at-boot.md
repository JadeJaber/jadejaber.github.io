---
published: true
layout: post
excerpt: Chkconfig to start application at boot
categories: articles
share: true
tags:
  - linux
  - shell
  - tips
  - services
---

Start postfix at boot
```shell
chkconfig postfix on
```

Check which services are started at boot

```shell
chkconfig --list |grep postfix
```