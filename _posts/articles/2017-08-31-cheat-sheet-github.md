---
published: true
layout: post
categories: articles
share: true
tags:
  - github
  - git
---
# From cloning to pull request

1. Add ytou public key on your Github settings

2. Fork the repo from the UI

3. Clone the repo  
```shell
git clone [poject Git URL]
```
4. In order to make pull requests, we need to link to an upstream repo
```shell
git remote add upstream [username/repo]
```
5. Create a new branch for your new feature 
```shell
git checkout -b my-new-feature
```
6. Make your own modifications

7. Commit your modifications 
```shell
git commit -am 'Add some feature'
```
8. Merge the upstream with your branch 
```shell
git pull --rebase upstream
```
9. Fix conflicts 

10. Create a pull request on Github
