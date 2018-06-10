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
git clone [project Git URL]Ò
```
3. In order to make pull requests, we need to sync to our distant repo, and we need an upstream remote to do that: 
```shell
git remote add upstream [username/repo]
```

### 1.2 Next contributions

1. Go to working directory and checkout to your master branch

2. Update your local repository with the source project
```git
git pull --rebase master origin 
```

### 1.3 Common procedure

1. Create a new branch for your new feature 
```shell
git checkout -b my-new-feature
```
2. Make your own modifications

3. Commit your modifications 
```shell
git add -all
git commit -m 'Add some feature'   
# OR
git commit -am 'Add some feature' 
```
4. Pull rebase the master origin into your branch 
```shell
git pull --rebase master origin
```
5. Fix conflicts and re-pull

6. Push to your upstream / branch
```git
git push my-new-feature upstream
```

7. Create a pull request on Github

8. Once the pull request is validated you may delete your branch
```shell
git branch --d my-new-feature
OR
git branch --D my-new-feature #--D is to force
```


