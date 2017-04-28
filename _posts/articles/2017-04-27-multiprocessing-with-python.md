---
published: true
layout: post
categories: articles
share: true
tags:
  - multiprocessing
  - python
  - tips
---
```python
from multiprocessing import Process, Queue, Pool
import datetime

def carre(nb):
        temp=nb*nb
        print (datetime.datetime.now())
        print (temp)

nb_thread=3
pool = Pool(processes=nb_thread)

print ("Nombre de thead : "+str(nb_thread))

list_nb=[3,8,10,44,90,32,76]
print("start exe : "+str(datetime.datetime.now()))
get_carre=pool.map(carre, list_nb)
```
