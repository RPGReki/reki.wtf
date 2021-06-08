#!/bin/bash

cd "$(git rev-parse --show-toplevel)" || exit 1

bundle exec jekyll b --config _config.yml --future

#rm -rf "doc/crystaldown/blog/20*" "doc/amauga/blog/20*"
