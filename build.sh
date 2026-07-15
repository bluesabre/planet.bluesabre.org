#!/bin/bash

export PATH=/home/bluesabre/gems/bin:/home/bluesabre/bin:/home/bluesabre/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

function build_site() {
    rm -rf build/
    jekyll build --destination build/
}

function serve_site() {
    jekyll serve
}

function deploy() {
    build_site
    cp -R build/* /var/www/planet.bluesabre.org/
    rm -rf ~/planet-builds/*
    cp -R build/* ~/planet-builds/
    cd ~/planet-builds
    git add -u
    git add .
    git commit -m "Update site"
    git push
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

if [[ "$1" == "deploy" ]]; then
    deploy
    exit 0
fi

build_site
