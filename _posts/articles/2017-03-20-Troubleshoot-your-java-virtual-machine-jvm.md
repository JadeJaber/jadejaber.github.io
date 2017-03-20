---
published: true
layout: post
excerpt: Troubleshoot your java virtual machine jvm with jstack and jmap
categories: articles
share: true
tags:
  - linux
  - java
  - debug troubleshooting optimization
---
## 1. JMAP & JCMD: Memory

The jmap command-line utility prints memory-related statistics for a running VM or core file.

It is suggested to use the latest utility, **jcmd** instead of the previous jmap utility for enhanced diagnostics and reduced performance overhead

If the jstack pid command does not respond because of a hung process, then the -F option can be used (on Oracle Solaris and Linux operating systems only) to force a stack dump

```shell
jmap -F [process id]
```
source : [https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr014.html]([https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr014.html)

## 2. JSTACK: Threads

The jstack command-line utility attaches to the specified process or core file and prints the stack traces of all threads that are attached to the virtual machine, including Java threads and VM internal threads, and optionally native stack frames. The utility also performs deadlock detection.

If the jstack pid command does not respond because of a hung process, then the -F option can be used (on Oracle Solaris and Linux operating systems only) to force a stack dump

```shell
jstack -F [process _id]
#OR
kill -3 [PID] 
```

source : [https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr016.html](https://docs.oracle.com/javase/8/docs/technotes/guides/troubleshoot/tooldescr016.html)