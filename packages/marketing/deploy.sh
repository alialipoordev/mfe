#!/bin/bash

set -e

REPO_URL=https://github.com/alialipoordev/mfe.git
BRANCH=gh-pages
TEMP_DIR=./temp-gh-pages

npm run build

git clone --branch $BRANCH $REPO_URL $TEMP_DIR

rm -rf $TEMP_DIR/marketing

mkdir -p $TEMP_DIR/marketing
cp -r ./dist/* $TEMP_DIR/marketing/

cd $TEMP_DIR
git add .
git commit -m "Deploy marketing at $(date)"
git push origin $BRANCH

cd ..
rm -rf $TEMP_DIR
