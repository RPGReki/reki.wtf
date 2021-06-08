#!/bin/bash

function sync-story-posts {
    (
        inotifywait -q -r -m -e modify -e create -e moved_to {amauga,crystaldown,scions,reincarnated-as-cat}/_posts |
        while read path action file; do
            target_path="site/_posts/$(echo ${path} | cut -d '/' -f 1)/$(echo ${path} | cut -d '/' -f 3)"
            [ -d "$target_path" ] || mkdir -p "${target_path}"
            cp "${path}${file}" "${target_path}/${file}"
        done
    )&
    echo -$! | tee -a .PID 
}

function sync-personal-posts {
    (
        inotifywait -q -r -m -e modify -e create -e moved_to "0xReki/blog/_posts" |
        while read path action file; do
            target_path="site/_posts/personal/$(echo ${path} | cut -d '/' -f 4)"
            [ -d "$target_path" ] || mkdir -p "${target_path}"
            cp "${path}${file}" "${target_path}/${file}"
        done
    ) &
    echo -$! | tee -a .PID
}

function wait-for-input {
    while [ true ]; do
        read -t 10 -n 1
        if [ $? = 0 ]; then
            return
        fi
    done
}

function build {
    if [ "$1" = "testing" ]; then
        export JEKYLL_ENV=unpublished
    else
        export JEKYLL_ENV=production
    fi

    if [ "$1" = "production" ]; then
        _config=_config.yml
    else
        _config=_config.yml,_config.local.yml
    fi

    if [ "$2" = "--watch" ]; then
        bundle exec jekyll b --config ${_config} --future --trace -q "$2" &
        echo $! | tee -a .PID
    else
        bundle exec jekyll b --config ${_config} --future --trace "$2"
    fi
}

function kill-tasks {
    for i in $(cat .PID); do
        echo SIGTERM PID ${i}…
        kill -s 15 ${i}
    done
    
    for i in $(cat .PID); do
        echo SIGKILL PID ${i}…
        kill -s 9 ${i}
    done

    rm .PID
}
