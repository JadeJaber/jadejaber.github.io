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
# Imports
```python
In [1]: import pandas as pd
In [2]: import numpy as np
In [3]: import matplotlib.pyplot as plt
```

# Data Structures
[source](http://pandas.pydata.org/pandas-docs/stable/dsintro.html)
## Series
Series is a one-dimensional labeled array capable of holding any data type (integers, strings, floating point numbers, Python objects, etc.). The axis labels are collectively referred to as the index.

Create a serie
```pyhton
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



