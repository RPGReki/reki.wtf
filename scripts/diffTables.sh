#!/bin/bash

cd "$(git rev-parse --show-toplevel)/site" || exit 1

for i in {amauga,crystaldown,scions,reincarnated-as-cat}; do
    (
        echo "Entering $i…"
        cd "$i" || return
        for j in [0-9]*; do
            (
                cd "$j" || return
                markdowny table -t --fields chapter title published day notes _words -- *.md | diff .table.md -
            )
        done
    echo "… done."
    )
done

for i in {../amauga/_posts,../crystaldown/_posts,../scions/_posts,../0xreki.github.io/_posts}; do
    (
        echo "Entering $i…"
        cd "$i" || return
        for j in [0-9]*; do
            (
                cd "$j" || return
                markdowny table --fields _filename title long _words -- *.md | diff .table.md -
            )
        done
    echo "… done."
    )
done
