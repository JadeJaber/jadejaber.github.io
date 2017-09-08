---
published: true
layout: post
excerpt: Purge daily logs on Linux
categories: articles
share: true
tags:
  - linux
  - shell
  - logs
  - tips
---
**Logging daily purge**

To be configured on cron

```shell
0 2 * * * find /var/log -type f -mtime +7 | xargs --no-run-if-empty rm
```

**Get number of distinct log file within a folder"
```shell
 ls  /var/log/ranger/admin | cut -d '.' -f 1 | uniq -c
```