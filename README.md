# planet.bluesabre.org

Feed aggregator for Xfce and Xubuntu releases. Powered by:

- [Kasper](https://github.com/rosario/kasper)
- [Jekyll](https://github.com/jekyll/jekyll)
- [Planet Pluto](https://github.com/feedreader/planet.rb)


## Installation

    git clone https://github.com/bluesabre/planet.bluesabre.org
    cd planet.bluesabre.org
    gem install jekyll
    gem install jekyll-paginate


## Configuration

### Planet Pluto Configuration

Add additional sources to planet.ini.

    title = Planet Ruby

    [rubylang]
        title = Ruby Lang News
        link  = http://www.ruby-lang.org/en/news
        feed  = http://www.ruby-lang.org/en/feeds/news.rss

Use the pluto command line tool and pass in the planet configuration.

    pluto update planet.ini

This will

1) fetch all feeds listed in `planet.ini` and

2) store all entries in a local database, that is, `planet.db` in your working folder.


### Generate Planet Posts

Use the planet.rb script to generate the blog posts for your static website.

    ruby ./planet.rb


This will

1) fetch the latest entries from the local database, that is, `planet.db` and

2) generate a blog story for every entry in `_posts/`


### Build and Serve

Build page and start local web server

    jekyll serve

Build page into `_site` folder

    jekyll build


## Copyright & License

Kasper Theme - Copyright (C) 2013 Ghost Foundation - Released under the MIT License.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
