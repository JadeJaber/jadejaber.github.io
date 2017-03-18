#/bin/bash

git add --all
git commit -m "$1" --allow-empty
git push -u origin master
