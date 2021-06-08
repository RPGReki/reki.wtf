#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

scripts/copyPosts.sh

scripts/buildTesting.sh --watch &

netlify dev &

scripts/syncNewPosts.sh
