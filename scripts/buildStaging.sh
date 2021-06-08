#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

export JEKYLL_ENV=production

bundle exec jekyll b --config _config.yml,_config.local.yml --future --trace "$@"
