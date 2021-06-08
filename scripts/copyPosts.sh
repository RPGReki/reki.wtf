#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

for i in {amauga,crystaldown,reincarnated-as-cat}; do
    [ -d "site/_posts/${i}" ] || mkdir -p "site/_posts/${i}"
    cp -r "${i}/_posts/*" "site/_posts/${i}"
done

[ -d "site/_post/personal" ] || mkdir -p "site/_posts/personal"
cp -r "0xReki/blog/_posts/*" "site/_posts/personal"
