---
published: true
layout: post
categories: articles
share: true
tags:
  - github
  - git
---
https://prose.io/#JadeJaber/jadejaber.github.io/edit/master/_posts/articles/2017-08-31-cheat-sheet-github.md

![git cheat sheet]({{site.baseurl}}/images/git-sheet-cheat.001.jpeg)


## 1. git stash

If you want to keep your current modifications you may use git stash
```shell
git stash 
```

You may list/show all your stashes
```shell
git stash list 

git stash show -v [stash number]
```

And then retrieve back your modifications
```shell
# by creating a new branch
git stash branch [new branch] [stash number]

# or by applying it to your current branch
git stash apply [stash number] #apply will apply the modification and keep the stash
git pop apply [stash number]  #pop will apply the modification and purge the stash
```

## 2. git cherry-pick

If you want to apply commits of other branches on your current branch

Collect the hash of the commits you would like to apply to your current branch by using "git log"
Checkout to your current branch
Then cherry-pick the commits. This will add+commit the modifications to your current branch.
```shell
git cherry-pick d8119f49cd4fd6b0366c5ca3af205f9c25af89ba
```

## 3. git log

Verbose log
```shell
git log --stat
git log --stat -n 10  #limits the number of commits
git log --after=01/01/2019 
git log --before=01/01/2019 
git log --author=jade 
```

List the delta of commits between 2 branches, remotes ones included
```shell
git log origin/master..HEAD
git log origin/feature..<mybranch>
...
```

## 4. git bisect

If you find out a bug in your application, "git bisect" helps you find the commit that introduced the bug. 
```shell
git bisecg stat #tells git to start the bisect process
git bisect bad #tells git that the current commit is buggy
git bisect good <commit hash|tag> #tells git that this commit was not buggy (coz I remember so...)

# from here you need to deploy/test your application after each "git bisect <bad|good>" command
# git will pick a commit in the middle of the remaining commits after each "git bisect <bad|good>"
# until it reaches the commit wich indroduced the bug
git bisect <bad|good>

# This may be automated with any CI tool 
```shell
git bisect start HEAD v2.0 
git bisect run my test  # Git will run "my test" to decide if a commit is a good or bad one.
```

