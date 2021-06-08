#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

rm -rf "site/_posts/*"

for i in {amauga,crystaldown,scions,reincarnated-as-cat}; do
    [ -d "site/_posts/${i}" ] || mkdir -p "site/_posts/${i}"
    for j in ${i}/_posts/20*; do
        cp -r "${j}" "site/_posts/${i}"
    done
done

[ -d "site/_post/personal" ] || mkdir -p "site/_posts/personal"
for j in 0xReki/blog/_posts/20*; do
    cp -r "${j}" "site/_posts/personal"
done
