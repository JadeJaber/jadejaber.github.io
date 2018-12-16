---
published: true
layout: post
categories: articles
share: true
tags:
  - github
  - git
---


![git cheat sheet]({{site.baseurl}}/images/git-sheet-cheat.001.jpeg)


## 1. git stash

If you want to keep your current modifications you may use git stash
```shell
git stash 
```

You may list/show all your stashes
```shell
git stash --list 

git stash --show -v [stash number]
```

And then retrieve back your modifications
```shell
# by creating a new branch
git stash branch [new branch] [stash number]

# or by applying it to your current branch
git stash apply [stash number]
```
