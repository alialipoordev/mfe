#!/bin/bash

set -e

REPO_URL=https://github.com/alialipoordev/mfe.git
BRANCH=gh-pages
TEMP_DIR=./temp-gh-pages

npm run build

git clone --branch $BRANCH $REPO_URL $TEMP_DIR

rm -rf $TEMP_DIR/container

mkdir -p $TEMP_DIR/container
cp -r ./dist/* $TEMP_DIR/container/

cd $TEMP_DIR
git add .
git commit -m "Deploy container at $(date)"
git push origin $BRANCH

cd ..
rm -rf $TEMP_DIR
