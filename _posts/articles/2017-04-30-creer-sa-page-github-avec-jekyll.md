---
published: true
layout: post
excerpt: description
categories: articles
share: true
tags:
  - jekyll
---

Pour installer Jekyll sur sont poste
- Il faut la version de Ruby > 2.x
- Il est nstallé ici : usr/local/bin/ruby


Il a été installé comme suit (ubuntu) : 
```shell
sudo apt-get -y update
sudo apt-get -y install build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev
cd /tmp
wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.gz
tar -xvzf ruby-2.0.0-p481.tar.gz
cd ruby-2.0.0-p481/
./configure --prefix=/usr/local
make
sudo make install
``` 
Ensuite installer bundler
```shell
sudo /usr/local/bin/gem install bundler
``` 

Puis suivre ici : https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

J'ai forké le template que je souhaite récupérer dans mon gitpage -> so-simple-theme

Il y a ce site qui propse de faire du whysiwyg avec Jekyll [http://prose.io/#JadeJaber](http://prose.io/#JadeJaber)