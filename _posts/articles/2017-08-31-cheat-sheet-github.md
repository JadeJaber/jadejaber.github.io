---
published: true
layout: post
categories: articles
share: true
tags:
  - github
  - git
---
## 1. Forking and contributing a repo

### 1.1 First contribution

1. Fork the repo from the UI

2. Clone the forked repo on your working machine  
```shell
git clone [project Git URL]
```
3. In order to make pull requests, we need to link to an upstream remote
```shell
git remote add upstream [username/repo]
```
4. Create a new branch for your new feature 
```shell
git checkout -b my-new-feature
```
5. Make your own modifications

6. Commit your modifications 
```shell
git add -all
git commit -m 'Add some feature'   
# OR
git commit -am 'Add some feature' 
```
7. Merge the upstream with your branch 
```shell
git pull --rebase upstream
```
9. Fix conflicts 

10. Create a pull request on Github

11. Once the pull request is validated you may delete your branch
```shell
git branch --d my-new-feature
OR
git branch --D my-new-feature #--D is to force
```

### 1.2 Next contributions

1. Go to working directory 

2. Update your local repository with the source project
```git
git pull --rebase master origin 
```

3. Update 

 
