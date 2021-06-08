#!/bin/bash
set -m
cd "$(git rev-parse --show-toplevel)" || exit 1

(
    inotifywait -r -m -e modify -e create -e moved_to {amauga,crystaldown,scions,reincarnated-as-cat}/_posts |
    while read path action file; do
        target_path="site/_posts/$(echo ${path} | cut -d '/' -f 1)/$(echo ${path} | cut -d '/' -f 3)"
        [ -d "$target_path" ] || mkdir -p "${target_path}"
        cp "${path}${file}" "${target_path}/${file}"
    done
)&
PIDS+=($!)

(
    inotifywait -r -m -e modify -e create -e moved_to "0xReki/blog/_posts" |
    while read path action file; do
        target_path="site/_posts/personal/$(echo ${path} | cut -d '/' -f 4)"
        [ -d "$target_path" ] || mkdir -p "${target_path}"
        cp "${path}${file}" "${target_path}/${file}"
    done
)&
PIDS+=($!)

while [ true ]; do
    read -t 10 -n 1
    if [ $? = 0 ]; then
        for i in ${PIDS[@]}; do
            echo $i
            kill -- -$i
        done
        exit
    fi
done
