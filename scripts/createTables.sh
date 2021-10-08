#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

for i in {amauga,crystaldown,scions,reincarnated-as-cat}; do
    (
        echo "Entering $i…"
        cd "$i/pages/" || exit 1
        for j in [0-9]*; do
            (
                cd "$j" || exit
                markdowny table --fields chapter title published day notes _words -- *.md | tee .table.md
            )
        done
    echo "… done."
    )
done

for i in {amauga/_posts,crystaldown/_posts,scions/_posts,personal-blog/_posts}; do
    (
        echo "Entering $i…"
        cd "$i" || exit 1
        for j in [0-9]*; do
            (
                cd "$j" || exit 1
                echo "$j"
                markdowny table -t --fields _filename title long _words -- *.md | tee .table.md
                echo ""
            )
        done
    echo "… done."
    )
done
