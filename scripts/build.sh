#!/bin/bash

set -m

cd "$(git rev-parse --show-toplevel)" || exit 1

source scripts/_functions.sh

build $1 $2
