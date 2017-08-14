---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - python
  - virtualization
---
1.Check taht venv is installed
```shell 
python -m venv
```

If it isn't install it 
```shell
pip install --user virtualenv
```

2.Create your virtual env
```shell
python -m venv  [project name] 
```

If you get the following error 

```shell
Error: Command '['/Users/jadejaber/source/v20-python-samples/envv20/bin/python', '-Im', 'ensurepip', '--upgrade', '--default-pip']' returned non-zero exit status 1.
```

Exclude pip from your environment: [More info](https://stackoverflow.com/questions/26215790/venv-doesnt-create-activate-script-python3)

```shell
python -m venv --without-pip [project name] 
```


