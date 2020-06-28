#!/bin/bash

export PATH=/home/bluesabre/gems/bin:/home/bluesabre/bin:/home/bluesabre/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

function update_planet_db {
    sqlite3 planet.db "UPDATE items SET published = '2019-07-28 12:00:00' WHERE title = 'Mugshot 0.4.2';"
    sqlite3 planet.db "UPDATE items SET published = '2018-08-08 12:00:00' WHERE title = 'Mugshot 0.4.1';"
    sqlite3 planet.db "UPDATE items SET published = '2018-04-11 12:00:00' WHERE title = 'Mugshot 0.4.0';"
    sqlite3 planet.db "UPDATE items SET published = '2016-11-02 12:00:00' WHERE title = 'Mugshot 0.3.2';"
    sqlite3 planet.db "UPDATE items SET published = '2016-03-31 12:00:00' WHERE title = 'Mugshot 0.3.1';"
    sqlite3 planet.db "UPDATE items SET published = '2015-09-07 12:00:00' WHERE title = 'Mugshot 0.3.0';"
    sqlite3 planet.db "UPDATE items SET published = '2014-09-01 12:00:00' WHERE title = 'Mugshot 0.2.5';"
    sqlite3 planet.db "UPDATE items SET published = '2014-08-02 12:00:00' WHERE title = 'Mugshot 0.2.4';"
    sqlite3 planet.db "UPDATE items SET published = '2014-04-04 12:00:00' WHERE title = 'Mugshot 0.2.3';"
    sqlite3 planet.db "UPDATE items SET published = '2014-03-09 12:00:00' WHERE title = 'Mugshot 0.2.2';"
    sqlite3 planet.db "UPDATE items SET published = '2019-05-31 12:00:00' WHERE title = 'MenuLibre 2.2.1';"
    sqlite3 planet.db "UPDATE items SET published = '2018-03-16 12:00:00' WHERE title = 'MenuLibre 2.2.0';"
    sqlite3 planet.db "UPDATE items SET published = '2018-02-05 12:00:00' WHERE title = 'MenuLibre 2.1.5';"
    sqlite3 planet.db "UPDATE items SET published = '2018-01-18 12:00:00' WHERE title = 'MenuLibre 2.1.4';"
    sqlite3 planet.db "UPDATE items SET published = '2016-04-07 12:00:00' WHERE title = 'MenuLibre 2.1.3';"
    sqlite3 planet.db "UPDATE items SET published = '2015-10-08 12:00:00' WHERE title = 'MenuLibre 2.1.2';"
    sqlite3 planet.db "UPDATE items SET published = '2015-09-20 12:00:00' WHERE title = 'MenuLibre 2.1.1';"
    sqlite3 planet.db "UPDATE items SET published = '2015-08-18 12:00:00' WHERE title = 'MenuLibre 2.1.0';"
    sqlite3 planet.db "UPDATE items SET published = '2015-08-08 12:00:00' WHERE title = 'MenuLibre 2.0.7';"
    sqlite3 planet.db "UPDATE items SET published = '2015-08-04 12:00:00' WHERE title = 'MenuLibre 2.0.6';"
    sqlite3 planet.db "UPDATE items SET published = '2020-02-19 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.5';"
    sqlite3 planet.db "UPDATE items SET published = '2018-04-11 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.4';"
    sqlite3 planet.db "UPDATE items SET published = '2017-10-03 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.3';"
    sqlite3 planet.db "UPDATE items SET published = '2017-01-29 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.2';"
    sqlite3 planet.db "UPDATE items SET published = '2016-12-08 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.1';"
    sqlite3 planet.db "UPDATE items SET published = '2016-12-08 12:00:00' WHERE title = 'SGT Puzzles Collection 0.2.0';"
    sqlite3 planet.db "UPDATE items SET published = '2016-11-03 12:00:00' WHERE title = 'SGT Puzzles Collection 0.1.0';"
    sqlite3 planet.db "UPDATE items SET published = '2020-06-22 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.8';"
    sqlite3 planet.db "UPDATE items SET published = '2019-11-15 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.7';"
    sqlite3 planet.db "UPDATE items SET published = '2018-09-10 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.6';"
    sqlite3 planet.db "UPDATE items SET published = '2018-03-18 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.5';"
    sqlite3 planet.db "UPDATE items SET published = '2018-02-20 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.4';"
    sqlite3 planet.db "UPDATE items SET published = '2017-09-23 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.3';"
    sqlite3 planet.db "UPDATE items SET published = '2016-10-06 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.2';"
    sqlite3 planet.db "UPDATE items SET published = '2015-05-20 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.1';"
    sqlite3 planet.db "UPDATE items SET published = '2015-02-15 12:00:00' WHERE title = 'LightDM GTK+ Greeter 2.0.0';"
    sqlite3 planet.db "UPDATE items SET published = '2014-08-20 12:00:00' WHERE title = 'LightDM GTK+ Greeter 1.9.0';"
    sqlite3 planet.db "UPDATE items SET published = '2017-09-20 12:00:00' WHERE title = 'LightDM GTK+ Greeter Settings 1.2.2';"
    sqlite3 planet.db "UPDATE items SET published = '2016-04-07 12:00:00' WHERE title = 'LightDM GTK+ Greeter Settings 1.2.1';"
    sqlite3 planet.db "UPDATE items SET published = '2015-03-19 12:00:00' WHERE title = 'LightDM GTK+ Greeter Settings 1.2.0';"
    sqlite3 planet.db "UPDATE items SET published = '2015-02-16 12:00:00' WHERE title = 'LightDM GTK+ Greeter Settings 1.1.0';"
    sqlite3 planet.db "UPDATE items SET published = '2014-03-21 12:00:00' WHERE title = 'LightDM GTK+ Greeter Settings 1.0.0';"

    sqlite3 planet.db "UPDATE items SET published = updated where published IS NULL;"
    sqlite3 planet.db "UPDATE items SET updated = NULL;"
}

function build_site() {
    rm -rf build/
    jekyll build --destination build/
}

function serve_site() {
    jekyll serve
}

function update_planet() {
    pluto update planet.ini
}

function update_planet_posts() {
    ruby ./planet.rb
}

function update_xfce_posts() {
    python3 fetch-xfce-announce.py $1
}

function update_ubuntu_packages() {
    python3 fetch-ubuntu-package.py
}

function update() {
    git pull
    if [[ "$1" == "ubuntu" ]]; then
        update_ubuntu_packages
    fi
    update_xfce_posts --fetch
    update_planet
    update_planet_db
    update_planet_posts
    update_xfce_posts --clean
}

function deploy() {
    build_site
    cp -R build/* /var/www/planet.bluesabre.org/
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

if [[ "$1" == "deploy" ]]; then
    deploy
    exit 0
fi

update $1
build_site
