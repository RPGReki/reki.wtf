#!/bin/bash
set -m

cd "$(git rev-parse --show-toplevel)" || exit 1

PIDS=()
scripts/buildStaging.sh --watch &
PIDS+=($!)

netlify dev &
PIDS+=($!)

scripts/syncPosts.sh

for i in ${PIDS[@]}; do
    echo $i
    kill -- -$i
done
