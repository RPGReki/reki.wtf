#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

PIDS=()

for i in {amauga,crystaldown,reincarnated-as-cat}; do
    (
        inotifywait -r -m -e modify -e create -e moved_to "${i}/_posts" |
        while read path action file; do
            target_path="site/_posts/$(echo ${path} | cut -d '/' -f 3)"
            [ -d "$target_path" ] || mkdir -p "${target_path}"
            cp "${path}${file}" "${target_path}/${file}"
        done
    )&
    PIDS+=($!)
done

(
    inotifywait -r -m -e modify -e create -e moved_to "0xReki/blog/_posts" |
    while read path action file; do
        target_path="site/_posts/$(echo ${path} | cut -d '/' -f 4)"
        [ -d "$target_path" ] || mkdir -p "${target_path}"
        cp "${path}${file}" "${target_path}/${file}"
    done
)&
PIDS+=($!)

(
    while [ true ]; do
        read -t 10 -n 1
        if [ $? = 0 ]; then
            return
        fi
    done
)

for i in PIDS; do
  kill $i
done
