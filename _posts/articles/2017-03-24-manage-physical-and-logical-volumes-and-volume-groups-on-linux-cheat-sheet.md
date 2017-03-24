---
published: true
layout: post
excerpt: How to Manage logical and physical volumes on linux
categories: articles
share: true
tags:
  - linux
  - shell
  - storage
  - cheat sheet
---
## 1. Main commands 
```shell
vgs
vgdisplay
vgscan
lvs
lvdisplay
lvscan
pvs
pvdisplay
pvscan
```

![lvm-cheatsheet.png]({{site.baseurl}}/images/lvm-cheatsheet.png)


## 2. How to extend a logical volume
```shell
lvextend -L+1.5G /dev/rootvg/usr_lv;   # Name of the logical volume
resize2fs /dev/rootvg/usr_lv  #Name of the mount point
```


source : [https://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/](https://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/)
