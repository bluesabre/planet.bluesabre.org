#!/bin/bash
# Local preview only — deployment now happens via .github/workflows/deploy.yml
# on every push to master.

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

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

build_site
