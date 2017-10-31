---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - panda
  - python
  - data processing
---
# Data Structures
## Lists
### Iterable and generators

Iterable
```python
lst = [1, 2, 3]
>>> for i in lst :
...     print(i)
```

Generator
```python
st = [x*x for x in range(3)]
>>> for i in lst :
...     print(i)
```

> Genrator cannot be read again and again since it generates values on the fly

Yield
```python
>>> def creerGenerateur() :
...     mylist = range(3)
...     for i in mylist:
...         yield i*i
...
>>> generateur = creerGenerateur() # crée un générateur
>>> print(generateur) # generateur est un objet !
< generator object creerGenerateur at 0x2b484b9addc0>
>>> for i in generateur:
...     print(i)
0
1
4
````

### Transform a liste

Standard transformation
```python
sequence = [element.upper() for element in sequence]
```
Mix chars and int
```python
print(['a' * nombre for nombre in sequence]) ## returns as much "a" as "nombre"  
```

Apply filters
```python
nombres = range(10)
print([nombre for nombre in nombres if nombre % 2 == 0]) ## keeps only even numbers
```

Looser
```python
>>> nombres = range(10)
>>> sommes = []
>>> for nombre in nombres:
...     if nombre % 2 == 0:
...         somme = 0
...         for i in range(nombre):
...             somme += i
...         sommes.append(somme)
...
>>> print(sommes)
[0, 1, 6, 15, 28]
```

Intermediate
```python
>>> sommes = []
>>> for nombre in range(10):
...     if nombre % 2 == 0:
...         sommes.append(sum(range(nombre)))
...
>>> print(sommes)
[0, 1, 6, 15, 28]
```

Advanced
```python
>>> print([sum(range(nombre)) for nombre in range(10) if nombre % 2 == 0])
```

Guru
```python
>>> [sum(range(nombre)) for nombre in range(0, 10, 2)]
```


## Series 
[source](http://pandas.pydata.org/pandas-docs/stable/dsintro.html)
Series is a one-dimensional labeled array capable of holding any data type (integers, strings, floating point numbers, Python objects, etc.). The axis labels are collectively referred to as the index.


### Create a serie
```python
import pandas as pd
import numpy as np

s = pd.Series(data, index=index)
```

Here, data can be many different things with examples bellow:
- a Python dict
- an ndarray
- a scalar value (like 5)

```python
d = {'a' : 0., 'b' : 1., 'c' : 2.}
s = pd.Series(np.random.randn(5), index=['a', 'b', 'c', 'd', 'e'])
pd.Series(5., index=['a', 'b', 'c', 'd', 'e'])
```

### Manipulate Series
```python
s[:3] & s[:-2] -> select
s[s > s.median()] -> filter
s[[4, 3, 1]] -> select by index
np.exp(s) -> operate on all cells
'e' in s -> returns true/false
s.get('f', "does not exist") -> if doesn't exist returns default value
s = pd.Series(np.random.randn(5), name='something') -> Give it a name
s2 = s.rename("different") -> Rename it
````

## DataFrames
### Create a dataframe
#### From dict of series
```shell
In [32]: d = {'one' : pd.Series([1., 2., 3.], index=['a', 'b', 'c']),
   ....:      'two' : pd.Series([1., 2., 3., 4.], index=['a', 'b', 'c', 'd'])}
In [33]: df = pd.DataFrame(d)
```
Select some raws(index) and columns
```python
pd.DataFrame(d, index=['d', 'b', 'a'], columns=['two', 'three'])
```
#### From dict of ndarrays / lists
```python
In [39]: d = {'one' : [1., 2., 3., 4.],
   ....:      'two' : [4., 3., 2., 1.]}   
```

You may add an index afterwards
```python
pd.DataFrame(d, index=['a', 'b', 'c', 'd'])
```


reprendre ici http://pandas.pydata.org/pandas-docs/stable/dsintro.html#from-structured-or-record-array
