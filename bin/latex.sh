#!/bin/bash

# build files, and then push source into github master and then push _site into gh-pages

#build files
#make site

git add . -A

echo -n "Enter the commit title and press [ENTER]: "
read commit_title
echo -n "Enter the commit description and press [ENTER]: "
read commit_desc


git commit -m "$commit_title" -m "$commit_desc"
git push
#git subtree push --prefix _site origin gh-pages
git push origin `git subtree split --prefix _site master`:gh-pages --force
