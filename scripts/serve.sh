#!/bin/bash
set -m

cd "$(git rev-parse --show-toplevel)" || exit 1

source scripts/_functions.sh

make tags && build "$1" && netlify dev "$2" &
echo $! >> .PID

(
    while true; do
        build "$1" --incremental
        sleep 10
    done
) &
echo -$! >> .PID

sync-story-posts

sync-personal-posts

wait-for-input

kill-tasks
