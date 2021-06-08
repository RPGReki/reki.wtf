#!/bin/bash
set -m

cd "$(git rev-parse --show-toplevel)" || exit 1

source scripts/_functions.sh

netlify dev "$2" &
echo $! | tee -a .PID

build "$1" --watch

sync-story-posts

sync-personal-posts

wait-for-input

kill-tasks
